module EventsHelper
  def event_status_translator(event)
    case event
      when 1
        "Not Started"
      when 2
        "In Progress"
      when 3
        "Missing"
      when 4
        "Unavailable"
      when 5
        "Completed"
      when 6
        "Action Needed"
      else "Something looks wrong"
    end
  end
end
