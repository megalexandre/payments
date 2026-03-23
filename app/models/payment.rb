class Payment < ApplicationRecord
    enum :status, { awaiting: "awaiting", deposited: "deposited", returned_unpaid: "returned_unpaid", paid: "paid" }

    after_initialize :set_default_status, if: :new_record?

    validates :amount, presence: true, numericality: { greater_than: 0 }
    validates :exchanged_at, presence: true
    validates :due_date, presence: true

    private

    def set_default_status
        self.status ||= :awaiting
    end
end
