class Room < ApplicationRecord
    belongs_to :user
    has_many :reservations
    mount_uploader :image, ImageUploader

    validates :name, presence: true
    validates :fee, presence: true
    validates :address, presence: true
    validates :introduction, presence: true
end
