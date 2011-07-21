Comatose.configure do |config|
  config.admin_title         = 'Comatose'
  config.admin_includes      = []
  config.admin_helpers       = []
  config.admin_sub_title     = 'The Micro CMS'
  config.content_type        = 'utf-8'
  config.default_filter      = 'None'
  config.default_processor   = :erb
  config.default_tree_level  = 2
  config.disable_caching     = false
  config.hidden_meta_fields  = []
  config.helpers             = []
  config.includes            = []
  config.allow_import_export = true
end

class Hash
  # Having the method_missing catchall in conjunction with get_binding
  # allows us to use the hash as a Context for ERB
  def method_missing(meth, *arg)
    if self.has_key? meth.to_s
      self[meth.to_s]
    else
      super
    end
  end


    # Gets the binding object for use with ERB
  def get_binding
    binding
  end
end