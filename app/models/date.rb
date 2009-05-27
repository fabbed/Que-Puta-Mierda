class Date
  def self.days_between(start, finish)
    (finish - start).to_i
  end
  
  def self.weeks_between(start, finish)
    days_between(start, finish) / 7
  end
  
  def self.months_between(start, finish)
    if start.year != finish.year
      difference = (12 - start.month) + (12 * years_between(start, finish)) + finish.month
    else
      difference = finish.month - start.month
    end
    difference -= 1 if finish.day < start.day
    difference
  end
  
  def self.years_between(start, finish)
    difference = finish.year - start.year
    difference -= 1 if difference > 0 && (finish.month < start.month || finish.day < start.day)
    difference
  end
end
