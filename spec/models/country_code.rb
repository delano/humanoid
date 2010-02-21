class CountryCode
  include Humanoid::Document
  field :code, :type => Integer
  key :code
  belongs_to :phone_number, :inverse_of => :country_codes
end