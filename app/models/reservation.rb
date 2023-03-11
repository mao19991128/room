class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :room

    validates :check_in, presence: true
    validates :check_out, presence: true
    validates :number, presence: true
    validate :in_out_check

    def in_out_check
        if check_in.present? && check_out.present? && check_in > check_out
            errors.add(:check_out, "は開始日より後の日付を入力してください")
        end
    end
end
