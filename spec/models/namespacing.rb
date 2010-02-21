module Medical
  class Patient
    include Humanoid::Document
    field :name
    has_many :prescriptions, :class_name => "Medical::Prescription"
  end
  class Prescription
    include Humanoid::Document
    field :name
  end
end