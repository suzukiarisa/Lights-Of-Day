class Place < ApplicationRecord

	belongs_to :festival
	validates :name, presence: true

	#オートコンプリート用
	scope :autocomplete, ->(term) {
	 where("name LIKE ?", "#{term}%").order(:name)
}
end
