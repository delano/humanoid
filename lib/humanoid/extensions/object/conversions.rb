# encoding: utf-8
module Humanoid #:nodoc:
  module Extensions #:nodoc:
    module Object #:nodoc:
      # This module converts objects into humanoid related objects.
      module Conversions #:nodoc:
        def self.included(base)
          base.class_eval do
            include InstanceMethods
            extend ClassMethods
          end
        end

        module InstanceMethods
          # Converts this object to a hash of attributes
          def humanoidize
            self.attributes
          end
        end

        module ClassMethods
          def set(value)
            value.respond_to?(:attributes) ? value.attributes : value
          end

          def get(value)
            self.new(value)
          end
        end
      end
    end
  end
end
