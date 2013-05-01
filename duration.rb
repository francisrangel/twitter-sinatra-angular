module Duration

  def duration(start_time, end_time)
    seconds = end_time - start_time
    minutes = seconds.to_i / 60
    hours = minutes.to_i / 60
    days = hours.to_i / 24
     
    new_hours = hours - (days * 24)
    new_minutes = minutes - (hours * 60)
     
    the_string = ""

    if days == 1
      the_string += "1d "
    elsif days > 0
      the_string += days.to_s + "d "
    end

    if new_hours == 1
      the_string += "1h "
    elsif new_hours > 0
      the_string += new_hours.to_s + "h "
    end

    if new_minutes == 1
      the_string += "1m "
    else
      the_string += new_minutes.to_s + "m"
    end

    the_string
  end
  
end