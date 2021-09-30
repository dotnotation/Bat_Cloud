class Note < ApplicationRecord
  belongs_to :bat
  belongs_to :researcher

  validates :content, presence: true
end
