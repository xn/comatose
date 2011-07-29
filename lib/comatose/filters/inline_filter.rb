module InlineFilter

  def inline(input)
    page = Comatose::Page.find_by_path(input)
    # Comatose.logger.debug "InlineFilter: context: #{@context['current_user']}"
    # TODO: Add more of the context into the included page's context...
    page.to_html({ 'params' => @context['params'], 'system' => @context['system'] })
  rescue => e
    Comatose.logger.debug e.message
    Comatose.logger.debug e.backtrace.join("\n")
    "Page at <tt>#{input}</tt> could not be found. <pre>#{$!}</pre>"
  end
end

Comatose.register_filter InlineFilter
