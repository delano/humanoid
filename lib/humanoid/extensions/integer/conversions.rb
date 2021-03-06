# encoding: utf-8
module Humanoid #:nodoc:
  module Extensions #:nodoc:
    module Integer #:nodoc:
      module Conversions #:nodoc:
        def set(value)
          return nil if value.blank?
          value =~ /\d/ ? value.to_i : value
        end
        def get(value)
          value
        end
      end
    end
  end
end
