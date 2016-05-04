class ActiveSupport::TimeWithZone
    def as_json(options = {})
        localtime.strftime("%-m/%-d/%Y at %l:%M%P (%a)")
    end
end