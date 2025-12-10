class Invoice < ApplicationRecord
    validates :identifier, uniqueness: true, presence: true
    before_validation :generate_identifier, on: :create

    belongs_to :client
    has_many :invoice_items, dependent: :destroy

    accepts_nested_attributes_for :invoice_items, allow_destroy: true

    private

    def generate_identifier
        return if identifier.present?

        self.identifier = "INV-#{SecureRandom.urlsafe_base64(10)}"
    end
end
