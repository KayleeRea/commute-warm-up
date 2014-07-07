class CommuteSorter
  def group_by_name(input)
    value = {}
    input.each do |row|
      name = row[0]
      previous_trips = value.fetch(name) { [] }
      trip = {
        :week => row[1],
        :day => row[2],
        :mode => row[3],
        :inbound => row[4],
        :outbound => row[5],
        :distance => row[6]
      }
      updated_trips = previous_trips << trip
      value[name] = updated_trips.sort do |a, b|
        same_week = compare_by_week(a, b).zero?
        if same_week
          compare_by_day(a, b)
        else
          compare_by_week(a, b)
        end
      end
    end
    value
  end

  def compare_by_week(a, b)
    a[:week] <=> b[:week]
  end

  def compare_by_day(a, b)
    day_number(a[:day]) <=> day_number(b[:day])
  end

  def day_number(day)
    case day
      when 'Monday'
        1
      when 'Tuesday'
        2
      when 'Wednesday'
        3
      when 'Thursday'
        4
      when 'Friday'
        5
    end
  end
end