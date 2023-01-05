class Ticket < ApplicationRecord
  belongs_to :project
  has_many :messages, dependent: :destroy

  validates :description, presence: true

end
