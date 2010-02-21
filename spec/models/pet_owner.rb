class PetOwner
  include Humanoid::Document
  field :title
  has_one :pet
  has_one :address
end