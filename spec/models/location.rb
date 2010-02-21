class Location
  include Humanoid::Document
  field :name
  belongs_to :address, :inverse_of => :locations
end