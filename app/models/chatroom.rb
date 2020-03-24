class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :users, through: :messages
  validates :topic, presence: true, case_sensitive: false
  validates :slug, presence: true, uniqueness: true
end
