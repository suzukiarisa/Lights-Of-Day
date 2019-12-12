class FestivalName < ApplicationRecord

	has_many :festivals
	accepts_nested_attributes_for :festivals

	validates :name, presence: true

	scope :autocomplete, ->(term) {
		 where("name LIKE ?", "#{term}%").order(:name)
	}
end
