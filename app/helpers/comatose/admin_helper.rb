
  module Comatose::AdminHelper

    # TODO - broken
    def comatose_admin_stylesheets(*names)
      strings = []
      names ||= ['comatose_admin']
      names.each do |name|
        Comatose.logger.debug("[**Comatose**]: stylesheet tag for: #{name}")
        strings << stylesheet_link_tag(name)
      end
      strings.join("\n")
    end


    # TODO - broken
    def comatose_admin_javascripts(*names)
      strings = []
      names ||= ['comatose_admin']
      names.each do |name|
        strings << javascript_include_tag(name)
      end
      strings
    end


    #  Checks the hidden_meta_fields class variable for a specified field name...
    def show_field?(key)
      !Comatose.config.hidden_meta_fields.include? key
    end


    def select_from_node(nodes, selected=nil, hide=nil, html_options={})
      html_options[:tabindex] ||= 9
      html_options[:label]    ||= "Parent"
      html_options[:name]     ||= "page[parent_id]"
      html_options[:id]       ||= "page_parent"
      html_options[:blank]    ||= false

      options = options_for_select(collection_from_node_for_select(nodes, hide, html_options[:label], html_options[:blank]), selected)
      select_tag html_options[:name], options, :id => html_options[:id], :tabindex => html_options[:tabindex]
    end


    # Used in the Page Form to build an indented drop-down list of pages
    def collection_from_node_for_select(nodes, hide=nil, label="Parent", add_initial=false)
      level       = 0
      options     = []

      if add_initial
        options << ["No #{label}", 0]
      end

      nodes.each do |node|
        collection_from_child_for_select(node, level, hide, options)
      end
      return options
    end


    # Called by collection_from_node_for_select
    def collection_from_child_for_select(node, level, hide, options=[])
      padding     = " " * level * 4
      padding     += '* ' unless level == 0

      hide_values = Array.new
      hide_values << hide if hide

      unless hide_values.include?(node.id)
        options << ["#{padding}#{node.title}", node.id]
        node.children.each do |child|
          collection_from_child_for_select(child, level + 1, hide, options)
        end
      end
      return options
    end

  end
