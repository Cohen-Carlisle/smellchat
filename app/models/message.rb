class Message < ApplicationRecord
  validates :author, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 500 }

  before_save do
    author = author.presence&.squish
    content = content.squish
  end
end
