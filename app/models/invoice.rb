class Invoice < ApplicationRecord
    validates :identifier, uniqueness: true
end
