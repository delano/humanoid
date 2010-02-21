# encoding: utf-8
module Humanoid #:nodoc:
  module Matchers #:nodoc:
    class Ne < Default
      # Return true if the attribute and first value are not equal.
      def matches?(value)
        @attribute != value.values.first
      end
    end
  end
end
