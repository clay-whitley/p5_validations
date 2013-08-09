class Event < ActiveRecord::Base
  validates :organizer_name, :organizer_email, :title, presence: true
  validates :title, uniqueness: true
  validates :organizer_email, format: { with: /[^@]+@[^\.]+\.[^\.]{2,}(\.[^\.]{2,})?\z/ }
  validate :date_checker

  def date_checker
    if self.date.nil?
      errors.add(:date, "invalid date, use format: yyyy/mm/dd")
    elsif self.date < Date::today
      errors.add(:date, "date cannot be in the past")
    end
  end
end
