# encoding: utf-8
module Humanoid #:nodoc:
  module Matchers #:nodoc:
    class Nin < Default
      # Return true if the attribute is not in the value list.
      def matches?(value)
        !value.values.first.include?(@attribute)
      end
    end
  end
end
