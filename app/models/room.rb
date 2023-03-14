class Room < ApplicationRecord
    belongs_to :user
    has_many :reservations
    mount_uploader :image, ImageUploader

    validates :name, presence: true
    validates :fee, presence: true
    validates :address, presence: true
    validates :introduction, presence: true

    def self.ransackable_attributes(auth_object = nil)
        ["address", "created_at", "fee", "id", "image", "introduction", "name", "updated_at", "user_id"]
    end

    def self.ransackable_associations(auth_object = nil)
        ["reservations", "user"]
      end
end
