#
# NONE
#
Comatose::TextFilters.define :none, "[No Filter]" do
  def render_text(text)
    text
  end
end
