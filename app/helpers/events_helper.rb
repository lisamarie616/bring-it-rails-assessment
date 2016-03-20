module EventsHelper
  def date_helper(datetime)
    datetime.blank? ? "n/a" : datetime.localtime.strftime("%_m/%-d/%Y at %l:%M%P (%a)")
  end
end
