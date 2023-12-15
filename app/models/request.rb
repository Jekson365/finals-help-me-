class Request < ApplicationRecord
  # validates
  belongs_to :subject
  has_many :subjects

  belongs_to :lecture
  has_many :lectures
end
