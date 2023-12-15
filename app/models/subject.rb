class Subject < ApplicationRecord
  has_many :lectures

  has_many :requests
  belongs_to :request

end
