class Lecture < ApplicationRecord

  validates :title, presence: true
  validates :lecture_end, presence: true
  validates :lecture_start, presence: true

  belongs_to :subject
  has_many :requests

  # belongs_to :request
  has_many :requests

end
