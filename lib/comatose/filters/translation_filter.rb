module TranslationFilter

  def t(input)
    I18n.translate(input)
  #rescue
  #  input
  end

end

Comatose.register_filter TranslationFilter