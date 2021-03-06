# encoding: utf-8
module Humanoid #:nodoc:
  module Collections #:nodoc:
    class Slaves
      include Mimic

      attr_reader :iterator

      # All read operations should delegate to the slave connections.
      # These operations mimic the methods on a Mongo:Collection.
      #
      # Example:
      #
      # <tt>collection.save({ :name => "Al" })</tt>
      proxy(:collection, Operations::READ)

      # Is the collection of slaves empty or not?
      #
      # Return:
      #
      # True is the iterator is not set, false if not.
      def empty?
        @iterator.nil?
      end

      # Create the new database reader. Will create a collection from the
      # slave databases and cycle through them on each read.
      #
      # Example:
      #
      # <tt>Reader.new(slaves, "humanoid_people")</tt>
      def initialize(slaves, name)
        unless slaves.blank?
          @iterator = CyclicIterator.new(slaves.collect { |db| db.collection(name) })
        end
      end

      protected
      def collection
        @iterator.next
      end
    end
  end
end
