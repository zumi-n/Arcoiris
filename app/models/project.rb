class Project < ApplicationRecord
  belongs_to :user
  belongs_to :proposition
  has_many :comment, dependent: :destroy

  validates :title, presence: true
  validates :phase, presence: true
  validates :content, presence: true

end
