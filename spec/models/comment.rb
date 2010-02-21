class Comment
  include Humanoid::Document
  include Humanoid::Versioning
  include Humanoid::Timestamps
  field :text
  key :text
  validates_presence_of :text
end