class Invoice < ApplicationRecord
    validates :identifier, uniqueness: true, presence: true

    belongs_to :client
    has_many :invoice_items, dependent: :destroy

    accepts_nested_attributes_for :invoice_items, allow_destroy: true

    before_validation :generate_identifier, on: :create
    before_save :calculate_cost_total

    private

    def generate_identifier
        return if identifier.present?

        self.identifier = "#{SecureRandom.urlsafe_base64(10)}"
    end

    def calculate_cost_total
        self.total = invoice_items.map { |item| (item.quantity || 0) * (item.per_cost || 0) }.sum
    end
end
