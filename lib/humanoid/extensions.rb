# encoding: utf-8
require "humanoid/extensions/array/accessors"
require "humanoid/extensions/array/aliasing"
require "humanoid/extensions/array/assimilation"
require "humanoid/extensions/array/conversions"
require "humanoid/extensions/array/parentization"
require "humanoid/extensions/boolean/conversions"
require "humanoid/extensions/date/conversions"
require "humanoid/extensions/datetime/conversions"
require "humanoid/extensions/float/conversions"
require "humanoid/extensions/hash/accessors"
require "humanoid/extensions/hash/assimilation"
require "humanoid/extensions/hash/conversions"
require "humanoid/extensions/hash/criteria_helpers"
require "humanoid/extensions/hash/scoping"
require "humanoid/extensions/integer/conversions"
require "humanoid/extensions/nil/assimilation"
require "humanoid/extensions/object/conversions"
require "humanoid/extensions/proc/scoping"
require "humanoid/extensions/string/conversions"
require "humanoid/extensions/string/inflections"
require "humanoid/extensions/symbol/inflections"
require "humanoid/extensions/time/conversions"

class Array #:nodoc
  include Humanoid::Extensions::Array::Accessors
  include Humanoid::Extensions::Array::Assimilation
  include Humanoid::Extensions::Array::Conversions
  include Humanoid::Extensions::Array::Parentization
end

class Boolean #:nodoc
  extend Humanoid::Extensions::Boolean::Conversions
end

class Date #:nodoc
  extend Humanoid::Extensions::Date::Conversions
end

class DateTime #:nodoc
  extend Humanoid::Extensions::DateTime::Conversions
end

class Float #:nodoc
  extend Humanoid::Extensions::Float::Conversions
end

class Hash #:nodoc
  include Humanoid::Extensions::Hash::Accessors
  include Humanoid::Extensions::Hash::Assimilation
  include Humanoid::Extensions::Hash::CriteriaHelpers
  include Humanoid::Extensions::Hash::Scoping
  extend Humanoid::Extensions::Hash::Conversions
end

class Integer #:nodoc
  extend Humanoid::Extensions::Integer::Conversions
end

class NilClass #:nodoc
  include Humanoid::Extensions::Nil::Assimilation
end

class Object #:nodoc:
  include Humanoid::Extensions::Object::Conversions
end

class Proc #:nodoc:
  include Humanoid::Extensions::Proc::Scoping
end

class String #:nodoc
  include Humanoid::Extensions::String::Inflections
  extend Humanoid::Extensions::String::Conversions
end

class Symbol #:nodoc
  remove_method :size if instance_methods.include? :size # temporal fix for ruby 1.9
  include Humanoid::Extensions::Symbol::Inflections
end

class Time #:nodoc
  extend Humanoid::Extensions::Time::Conversions
end
