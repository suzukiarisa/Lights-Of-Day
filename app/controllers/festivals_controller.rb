class FestivalsController < ApplicationController
  def index
  	@hokkaido_festivals = Festival.where(prefecture_id: 0)
  	@tohoku_festivals = Festival.where(prefecture_id: [1, 2, 3, 4, 5, 6])
  	@kanto_festivals = Festival.where(prefecture_id: [7, 8, 9, 10, 11, 12, 13])
  	@chubu_festivals = Festival.where(prefecture_id: [14, 15, 16, 17, 18, 19, 20, 21, 22, 23])
  	@kinki_festivals = Festival.where(prefecture_id: [24, 25, 26, 27, 28, 29])
  	@chugoku_festivals = Festival.where(prefecture_id: [30, 31, 32, 33, 34])
  	@shikoku_festivals = Festival.where(prefecture_id: [35, 36, 37, 38])
  	@kyushu_festivals = Festival.where(prefecture_id: [39, 40, 41, 42, 43, 44, 45])
  	@okinawa_festivals = Festival.where(prefecture_id: 46)
  end
end
