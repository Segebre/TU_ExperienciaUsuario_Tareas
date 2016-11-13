module ApplicationHelper
  def nice_date(date)
    return nil unless date
    date.strftime("%B %-d, %Y")
  end
end
