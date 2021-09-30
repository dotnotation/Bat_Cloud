class Bat < ApplicationRecord
    extend FriendlyID
    friendly_id :tag_number, use: :slugged 

    has_many :notes
    has_many :researchers, through: :notes
    belongs_to :discoverer, class_name: "Researcher"

    validates :tag_number, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\Z/ }
end
