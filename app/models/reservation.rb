class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :room

    validates :check_in, presence: true
    validates :check_out, presence: true
    validates :number, presence: true, numericality: {only_integer: true, greater_than: 0}
    validate :in_out_check

    def in_out_check
        if check_in.present? && check_out.present? && check_in > check_out
            errors.add(:check_out, "は開始日より後の日付を入力してください")
        end
    end

    def days
        days = (check_out.to_date - check_in.to_date).to_i
    end

    def sum_fee
        sum_fee = (days * number * room.fee)
    end
end
