class Cocktail < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    has_many :doses, dependent: :delete_all
    has_many :ingredients, through: :doses
end
