class Animal
  include Humanoid::Document
  field :name
  key :name
  belongs_to :person, :inverse_of => :pet
end