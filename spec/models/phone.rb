class Phone
  include Humanoid::Document
  field :number
  key :number
  belongs_to :person, :inverse_of => :phone_numbers
  has_one :country_code
end