class Bat < ApplicationRecord
    extend FriendlyId
    friendly_id :tag_number, use: :slugged 

    has_many :notes, dependent: :destroy
    has_many :researchers, through: :notes
    belongs_to :discoverer, class_name: "Researcher"

    validates :tag_number, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\Z/ }
    validates :date_found, presence: true

    scope :search, -> (query) { self.where("tag_number LIKE ?", "%#{query}%")}
    scope :recently_discovered, -> { order date_found: :desc}
    scope :alphabetized_bats, -> { order tag_number: :asc}
end
