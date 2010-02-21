# encoding: utf-8
module Humanoid #:nodoc:
  module Matchers #:nodoc:
    class Gt < Default
      # Return true if the attribute is greater than the value.
      def matches?(value)
        determine(value, :>)
      end
    end
  end
end
