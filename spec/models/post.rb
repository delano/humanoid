class Post
  include Humanoid::Document
  include Humanoid::Versioning
  include Humanoid::Timestamps
  field :title
  belongs_to_related :person

  named_scope :recent, where(:created_at => { "$lt" => Time.now, "$gt" => 30.days.ago })

  class << self
    def old
      where(:created_at => { "$lt" => 30.days.ago })
    end
  end
end