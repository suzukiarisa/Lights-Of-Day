class Message < ApplicationRecord

	validates :from_id, presence: true
	validates :to_id, presence: true
	validates :room_id, presence: true
	validates :content, presence: true, length: {maximum: 50}

	belongs_to :from, class_name: "User" #送信者
	belongs_to :to, class_name: "User" #受信者
	after_create_commit { MessageBroadcastJob.perform_later self }

  def Message.recent_in_room(room_id)
    where(room_id: room_id).last(500)
  end
end
