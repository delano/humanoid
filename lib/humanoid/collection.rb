# encoding: utf-8
require "humanoid/collections/operations"
require "humanoid/collections/cyclic_iterator"
require "humanoid/collections/mimic"
require "humanoid/collections/master"
require "humanoid/collections/slaves"

module Humanoid #:nodoc
  class Collection
    include Collections::Mimic
    attr_reader :counter, :name

    # All write operations should delegate to the master connection. These
    # operations mimic the methods on a Mongo:Collection.
    #
    # Example:
    #
    # <tt>collection.save({ :name => "Al" })</tt>
    proxy(:master, Collections::Operations::PROXIED)

    # Determines where to send the next read query. If the slaves are not
    # defined then send to master. If the read counter is under the configured
    # maximum then return the master. In any other case return the slaves.
    #
    # Example:
    #
    # <tt>collection.directed</tt>
    #
    # Return:
    #
    # Either a +Master+ or +Slaves+ collection.
    def directed(options = {})
      enslave = options.delete(:enslave) || @klass.enslaved?
      enslave ? master_or_slaves : master
    end

    # Find documents from the database given a selector and options.
    #
    # Options:
    #
    # selector: A +Hash+ selector that is the query.
    # options: The options to pass to the db.
    #
    # Example:
    #
    # <tt>collection.find({ :test => "value" })</tt>
    def find(selector = {}, options = {})
      cursor = Humanoid::Cursor.new(@klass, self, directed(options).find(selector, options))
      if block_given?
        yield cursor; cursor.close
      else
        cursor
      end
    end

    # Find the first document from the database given a selector and options.
    #
    # Options:
    #
    # selector: A +Hash+ selector that is the query.
    # options: The options to pass to the db.
    #
    # Example:
    #
    # <tt>collection.find_one({ :test => "value" })</tt>
    def find_one(selector = {}, options = {})
      directed(options).find_one(selector, options)
    end

    # Initialize a new Humanoid::Collection, setting up the master, slave, and
    # name attributes. Masters will be used for writes, slaves for reads.
    #
    # Example:
    #
    # <tt>Humanoid::Collection.new(masters, slaves, "test")</tt>
    def initialize(klass, name)
      @klass, @name = klass, name
    end

    # Perform a map/reduce on the documents.
    #
    # Options:
    #
    # map: The map javascript funcdtion.
    # reduce: The reduce javascript function.
    def map_reduce(map, reduce, options = {})
      directed(options).map_reduce(map, reduce, options)
    end

    alias :mapreduce :map_reduce

    # Return the object responsible for writes to the database. This will
    # always return a collection associated with the Master DB.
    #
    # Example:
    #
    # <tt>collection.writer</tt>
    def master
      @master ||= Collections::Master.new(Humanoid.master, @name)
    end

    # Return the object responsible for reading documents from the database.
    # This is usually the slave databases, but in their absence the master will
    # handle the task.
    #
    # Example:
    #
    # <tt>collection.reader</tt>
    def slaves
      @slaves ||= Collections::Slaves.new(Humanoid.slaves, @name)
    end

    protected
    def master_or_slaves
      slaves.empty? ? master : slaves
    end
  end
end
