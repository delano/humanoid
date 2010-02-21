class Translation
  include Humanoid::Document
  field :language
  belongs_to :name, :inverse_of => :translations
end