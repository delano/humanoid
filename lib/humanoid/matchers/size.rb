# encoding: utf-8
module Humanoid #:nodoc:
  module Matchers #:nodoc:
    class Size < Default
      # Return true if the attribute size is equal to the first value.
      def matches?(value)
        @attribute.size == value.values.first
      end
    end
  end
end
