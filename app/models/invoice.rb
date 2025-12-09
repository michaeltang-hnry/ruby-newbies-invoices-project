class Invoice < ApplicationRecord
    validates :identifier, uniqueness: true
    belongs_to :client
    has_many :invoice_items, dependent: :destroy

    accepts_nest_attributes_for :invoice_items, allow_destroy: true
end
