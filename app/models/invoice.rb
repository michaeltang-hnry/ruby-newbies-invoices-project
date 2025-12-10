class Invoice < ApplicationRecord
    validates :identifier, uniqueness: true
    belongs_to :client
    has_many :invoice_items, dependent: :destroy
end
