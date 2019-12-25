class FestivalName < ApplicationRecord

	belongs_to :festival
	accepts_nested_attributes_for :festival

	validates :name, presence: true

	scope :autocomplete, ->(term) {
		 where("name LIKE ?", "#{term}%").order(:name)
	}
end
