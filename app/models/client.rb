class Client < ApplicationRecord
    has_many :invoices

    validates :name, presence: true
    validates :email, presence: true
end
