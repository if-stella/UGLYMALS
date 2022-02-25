class Booking < ApplicationRecord
  belongs_to :animal
  belongs_to :user
  validates_presence_of :start_date, :end_date
  validate :date

  def date
    if self.end_date
      errors.add(:end_date, 'End date must be after start date') if self.end_date <= self.start_date
    end
  end

  def valid
    if status == 0
      return "denied"
    elsif status == 1
      return "pending"
    else
      return "confirmed"
    end
  end
end

