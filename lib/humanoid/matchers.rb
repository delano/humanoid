# encoding: utf-8
require "humanoid/matchers/default"
require "humanoid/matchers/all"
require "humanoid/matchers/exists"
require "humanoid/matchers/gt"
require "humanoid/matchers/gte"
require "humanoid/matchers/in"
require "humanoid/matchers/lt"
require "humanoid/matchers/lte"
require "humanoid/matchers/ne"
require "humanoid/matchers/nin"
require "humanoid/matchers/size"

module Humanoid #:nodoc:
  module Matchers
    # Determines if this document has the attributes to match the supplied
    # MongoDB selector. Used for matching on embedded associations.
    def matches?(selector)
      selector.each_pair do |key, value|
        return false unless matcher(key, value).matches?(value)
      end
      true
    end

    protected
    # Get the matcher for the supplied key and value. Will determine the class
    # name from the key.
    def matcher(key, value)
      if value.is_a?(Hash)
        name = "Humanoid::Matchers::#{value.keys.first.gsub("$", "").camelize}"
        return name.constantize.new(attributes[key])
      end
      Default.new(attributes[key])
    end
  end
end
