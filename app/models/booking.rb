class Booking < ApplicationRecord
  belongs_to :animal
  belongs_to :user
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
