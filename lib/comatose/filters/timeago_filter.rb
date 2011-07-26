module TimeagoFilter
  class Helpers
    extend ActionView::Helpers::DateHelper
  end

  def time_ago(input)
    TimeagoFilter::Helpers.distance_of_time_in_words_to_now(input, true)
  rescue
    #puts "Oops! -- #{$!}"
    input
  end
end

Comatose.register_filter TimeagoFilter
