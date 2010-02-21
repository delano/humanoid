# encoding: utf-8
require "humanoid/contexts/ids"
require "humanoid/contexts/paging"
require "humanoid/contexts/enumerable"
require "humanoid/contexts/mongo"

module Humanoid
  module Contexts
    # Determines the context to be used for this criteria. If the class is an
    # embedded document, then the context will be the array in the has_many
    # association it is in. If the class is a root, then the database itself
    # will be the context.
    #
    # Example:
    #
    # <tt>Contexts.context_for(criteria)</tt>
    def self.context_for(criteria)
      if criteria.klass.embedded
        return Contexts::Enumerable.new(criteria)
      end
      Contexts::Mongo.new(criteria)
    end

  end
end
