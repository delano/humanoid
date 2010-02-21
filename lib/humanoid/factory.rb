# encoding: utf-8
module Humanoid #:nodoc:
  class Factory #:nodoc:
    # Builds a new +Document+ from the supplied attributes.
    #
    # Example:
    #
    # <tt>Humanoid::Factory.build(Person, {})</tt>
    #
    # Options:
    #
    # klass: The class to instantiate from if _type is not present.
    # attributes: The +Document+ attributes.
    def self.build(klass, attrs)
      type = attrs["_type"]
      type ? type.constantize.instantiate(attrs) : klass.instantiate(attrs)
    end
  end
end
