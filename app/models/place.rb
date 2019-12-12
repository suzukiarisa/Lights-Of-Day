class Place < ApplicationRecord

	has_many :festivals

	validates :name, presence: true

	#オートコンプリート用
	scope :autocomplete, ->(term) {
	 where("name LIKE ?", "#{term}%").order(:name)
}
end
