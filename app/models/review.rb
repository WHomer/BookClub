class Review < ApplicationRecord
  
  belongs_to :book
  belongs_to :user

  validates_presence_of :title, :review, :rating

  def pretty_date(source = :created)
    if source == :updated; raw = self.updated_at.to_s
    else raw = self.updated_at.to_s
    end
    year = raw[0..3]; month = raw[5..6]; day = raw[8..9]
    hour = raw[11..12]; minute = raw[14..15]
    month_named = ""
    case month.to_i
    when 1; month_named = "Jan." when 2; month_named = "Feb." when 3; month_named = "Mar."
    when 4; month_named = "Apr." when 5; month_named = "May." when 6; month_named = "Jun."
    when 7; month_named = "Jul." when 8; month_named = "Aug." when 9; month_named = "Sep."
    when 10; month_named = "Oct." when 11; month_named = "Nov." when 12; month_named = "Dec."
    end
    return "#{day} #{month_named} #{year} at #{hour}:#{minute}"
  end

  def pretty_date_updated

  end
end
