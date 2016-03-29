module EventsHelper
  
  def start_date_helper(event)
    event.start_time.blank? ? "" : format_date(event.start_time)
  end

  def end_date_helper(event)
    event.end_time.blank? ? "n/a" : format_date(event.end_time)
  end

  def format_date(datetime)
    datetime.localtime.strftime("%_m/%-d/%Y at %l:%M%P (%a)")
  end
end
