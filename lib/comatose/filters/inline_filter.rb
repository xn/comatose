module InlineFilter
  def inline(input)
    page = Comatose::Page.find_by_path(input)
    params = @context['params']
    # TODO: Add more of the context into the included page's context...
    page.to_html({ 'params' => params  })
  rescue
    "Page at <tt>#{input}</tt> could not be found. <pre>#{$!}</pre>"
  end
end

Comatose.register_filter InlineFilter
