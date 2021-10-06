class Researcher < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged

    has_secure_password

    has_many :notes
    has_many :bats, through: :notes
    has_many :discovered_bats, foreign_key: "discoverer_id", class_name: "Bat"

    validates :name, presence: true, uniqueness: true, length: {minimum: 5}
    validates :email, presence: true, uniqueness: true, format: {with: URI::MailTo::EMAIL_REGEXP}
    # /\A[a-zA-Z0-9.!\#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*\z/
    validates :password, length: {in: 6..20}
end
