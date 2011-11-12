# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{comatose-rubyisbeautiful}
  s.version = "3.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.8.4") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Bryan Taylor, Matt McCray, Michael Kovacs}]

  s.date = %q{2011-09-01}
  s.description = %q{Web Content Management in Rails 3.}
  s.email = %q{ artofobjects at gmail dot com }
  s.extra_rdoc_files = [%q{CHANGELOG}, %q{LICENSE}, %q{README}, %q{README.markdown}, %q{lib/comatose.rb}, %q{lib/comatose/configuration.rb}, %q{lib/comatose/drop.rb}, %q{lib/comatose/engine.rb}, %q{lib/comatose/filters/inline_filter.rb}, %q{lib/comatose/filters/timeago_filter.rb}, %q{lib/comatose/filters/translation_filter.rb}, %q{lib/comatose/locale_constraint.rb}, %q{lib/comatose/logger.rb}, %q{lib/comatose/page_wrapper.rb}, %q{lib/comatose/processing_context.rb}, %q{lib/comatose/routes.rb}, %q{lib/comatose/tasks/admin.rb}, %q{lib/comatose/tasks/data.rb}, %q{lib/comatose/tasks/setup.rb}, %q{lib/comatose/text_filters.rb}, %q{lib/comatose/version.rb}, %q{lib/generators/comatose/USAGE}, %q{lib/generators/comatose/comatose_generator.rb}, %q{lib/generators/comatose/templates/comatose.rb}, %q{lib/generators/comatose/templates/migration.erb}, %q{lib/generators/comatose/templates/seeds.erb}, %q{lib/support/class_options.rb}, %q{lib/support/inline_rendering.rb}, %q{lib/support/route_mapper.rb}, %q{lib/tasks/comatose.rake}, %q{lib/text_filters/markdown.rb}, %q{lib/text_filters/markdown_smartypants.rb}, %q{lib/text_filters/none.rb}, %q{lib/text_filters/rdoc.rb}, %q{lib/text_filters/simple.rb}, %q{lib/text_filters/textile.rb}]
  s.files = [%q{CHANGELOG}, %q{Gemfile}, %q{Gemfile.lock}, %q{INSTALL}, %q{LICENSE}, %q{Manifest}, %q{README}, %q{README.markdown}, %q{Rakefile}, %q{SPECS}, %q{app/controllers/application_controller.rb}, %q{app/controllers/comatose/admin_controller.rb}, %q{app/controllers/comatose/application_controller.rb}, %q{app/controllers/comatose/base_controller.rb}, %q{app/helpers/application_helper.rb}, %q{app/helpers/comatose/admin_helper.rb}, %q{app/helpers/comatose/application_helper.rb}, %q{app/helpers/comatose/base_helper.rb}, %q{app/models/comatose/page.rb}, %q{app/views/comatose/admin/_form.html.erb}, %q{app/views/comatose/admin/_page_list_item.html.erb}, %q{app/views/comatose/admin/delete.html.erb}, %q{app/views/comatose/admin/edit.html.erb}, %q{app/views/comatose/admin/index.html.erb}, %q{app/views/comatose/admin/new.html.erb}, %q{app/views/comatose/admin/reorder.html.erb}, %q{app/views/comatose/admin/versions.html.erb}, %q{app/views/layouts/application.html.erb}, %q{app/views/layouts/comatose/admin.html.erb}, %q{app/views/layouts/comatose/base.html.erb}, %q{comatose-rubyisbeautiful.gemspec}, %q{config.ru}, %q{config/environment.rb}, %q{config/environments/development.rb}, %q{config/environments/production.rb}, %q{config/environments/test.rb}, %q{config/locales/en.yml}, %q{db/seeds.rb}, %q{lib/comatose.rb}, %q{lib/comatose/configuration.rb}, %q{lib/comatose/drop.rb}, %q{lib/comatose/engine.rb}, %q{lib/comatose/filters/inline_filter.rb}, %q{lib/comatose/filters/timeago_filter.rb}, %q{lib/comatose/filters/translation_filter.rb}, %q{lib/comatose/locale_constraint.rb}, %q{lib/comatose/logger.rb}, %q{lib/comatose/page_wrapper.rb}, %q{lib/comatose/processing_context.rb}, %q{lib/comatose/routes.rb}, %q{lib/comatose/tasks/admin.rb}, %q{lib/comatose/tasks/data.rb}, %q{lib/comatose/tasks/setup.rb}, %q{lib/comatose/text_filters.rb}, %q{lib/comatose/version.rb}, %q{lib/generators/comatose/USAGE}, %q{lib/generators/comatose/comatose_generator.rb}, %q{lib/generators/comatose/templates/comatose.rb}, %q{lib/generators/comatose/templates/migration.erb}, %q{lib/generators/comatose/templates/seeds.erb}, %q{lib/support/class_options.rb}, %q{lib/support/inline_rendering.rb}, %q{lib/support/route_mapper.rb}, %q{lib/tasks/comatose.rake}, %q{lib/text_filters/markdown.rb}, %q{lib/text_filters/markdown_smartypants.rb}, %q{lib/text_filters/none.rb}, %q{lib/text_filters/rdoc.rb}, %q{lib/text_filters/simple.rb}, %q{lib/text_filters/textile.rb}, %q{public/404.html}, %q{public/422.html}, %q{app/assets/500.html}, %q{app/assets/favicon.ico}, %q{app/assets/images/comatose/collapsed.gif}, %q{app/assets/images/comatose/expanded.gif}, %q{app/assets/images/comatose/no-children.gif}, %q{app/assets/images/comatose/page.gif}, %q{app/assets/images/comatose/rails.png}, %q{app/assets/images/comatose/spinner.gif}, %q{app/assets/images/comatose/title-hover-bg.gif}, %q{app/assets/javascripts/comatose/admin.js}, %q{app/assets/javascripts/comatose/application.js}, %q{app/assets/javascripts/comatose/dragdrop.js}, %q{app/assets/javascripts/editor.js}, %q{app/assets/javascripts/jquery/jquery.js}, %q{app/assets/javascripts/wymeditor.tar}, %q{app/assets/javascripts/wymeditor/iframe/default/lbl-blockquote.png}, %q{app/assets/javascripts/wymeditor/iframe/default/lbl-h1.png}, %q{app/assets/javascripts/wymeditor/iframe/default/lbl-h2.png}, %q{app/assets/javascripts/wymeditor/iframe/default/lbl-h3.png}, %q{app/assets/javascripts/wymeditor/iframe/default/lbl-h4.png}, %q{app/assets/javascripts/wymeditor/iframe/default/lbl-h5.png}, %q{app/assets/javascripts/wymeditor/iframe/default/lbl-h6.png}, %q{app/assets/javascripts/wymeditor/iframe/default/lbl-p.png}, %q{app/assets/javascripts/wymeditor/iframe/default/lbl-pre.png}, %q{app/assets/javascripts/wymeditor/iframe/default/wymiframe.css}, %q{app/assets/javascripts/wymeditor/iframe/default/wymiframe.html}, %q{app/assets/javascripts/wymeditor/jquery.wymeditor.js}, %q{app/assets/javascripts/wymeditor/jquery.wymeditor.min.js}, %q{app/assets/javascripts/wymeditor/jquery.wymeditor.pack.js}, %q{app/assets/javascripts/wymeditor/lang/bg.js}, %q{app/assets/javascripts/wymeditor/lang/ca.js}, %q{app/assets/javascripts/wymeditor/lang/cs.js}, %q{app/assets/javascripts/wymeditor/lang/cy.js}, %q{app/assets/javascripts/wymeditor/lang/de.js}, %q{app/assets/javascripts/wymeditor/lang/en.js}, %q{app/assets/javascripts/wymeditor/lang/es.js}, %q{app/assets/javascripts/wymeditor/lang/fa.js}, %q{app/assets/javascripts/wymeditor/lang/fi.js}, %q{app/assets/javascripts/wymeditor/lang/fr.js}, %q{app/assets/javascripts/wymeditor/lang/gl.js}, %q{app/assets/javascripts/wymeditor/lang/he.js}, %q{app/assets/javascripts/wymeditor/lang/hr.js}, %q{app/assets/javascripts/wymeditor/lang/hu.js}, %q{app/assets/javascripts/wymeditor/lang/it.js}, %q{app/assets/javascripts/wymeditor/lang/nb.js}, %q{app/assets/javascripts/wymeditor/lang/nl.js}, %q{app/assets/javascripts/wymeditor/lang/nn.js}, %q{app/assets/javascripts/wymeditor/lang/pl.js}, %q{app/assets/javascripts/wymeditor/lang/pt-br.js}, %q{app/assets/javascripts/wymeditor/lang/pt.js}, %q{app/assets/javascripts/wymeditor/lang/ru.js}, %q{app/assets/javascripts/wymeditor/lang/sv.js}, %q{app/assets/javascripts/wymeditor/lang/tr.js}, %q{app/assets/javascripts/wymeditor/lang/zh_cn.js}, %q{app/assets/javascripts/wymeditor/plugins/embed/jquery.wymeditor.embed.js}, %q{app/assets/javascripts/wymeditor/plugins/fullscreen/icon_fullscreen.gif}, %q{app/assets/javascripts/wymeditor/plugins/fullscreen/jquery.wymeditor.fullscreen.js}, %q{app/assets/javascripts/wymeditor/plugins/hovertools/jquery.wymeditor.hovertools.js}, %q{app/assets/javascripts/wymeditor/plugins/resizable/jquery.wymeditor.resizable.js}, %q{app/assets/javascripts/wymeditor/plugins/resizable/readme.txt}, %q{app/assets/javascripts/wymeditor/plugins/tidy/README}, %q{app/assets/javascripts/wymeditor/plugins/tidy/jquery.wymeditor.tidy.js}, %q{app/assets/javascripts/wymeditor/plugins/tidy/tidy.php}, %q{app/assets/javascripts/wymeditor/plugins/tidy/wand.png}, %q{app/assets/javascripts/wymeditor/skins/compact/icons.png}, %q{app/assets/javascripts/wymeditor/skins/compact/skin.css}, %q{app/assets/javascripts/wymeditor/skins/compact/skin.js}, %q{app/assets/javascripts/wymeditor/skins/default/icons.png}, %q{app/assets/javascripts/wymeditor/skins/default/skin.css}, %q{app/assets/javascripts/wymeditor/skins/default/skin.js}, %q{app/assets/javascripts/wymeditor/skins/minimal/images/bg.header.gif}, %q{app/assets/javascripts/wymeditor/skins/minimal/images/bg.selector.silver.gif}, %q{app/assets/javascripts/wymeditor/skins/minimal/images/bg.wymeditor.png}, %q{app/assets/javascripts/wymeditor/skins/minimal/images/icons.silver.gif}, %q{app/assets/javascripts/wymeditor/skins/minimal/skin.css}, %q{app/assets/javascripts/wymeditor/skins/minimal/skin.js}, %q{app/assets/javascripts/wymeditor/skins/silver/COPYING}, %q{app/assets/javascripts/wymeditor/skins/silver/README}, %q{app/assets/javascripts/wymeditor/skins/silver/images/bg.header.gif}, %q{app/assets/javascripts/wymeditor/skins/silver/images/bg.selector.silver.gif}, %q{app/assets/javascripts/wymeditor/skins/silver/images/bg.wymeditor.png}, %q{app/assets/javascripts/wymeditor/skins/silver/images/icons.silver.gif}, %q{app/assets/javascripts/wymeditor/skins/silver/skin.css}, %q{app/assets/javascripts/wymeditor/skins/silver/skin.js}, %q{app/assets/javascripts/wymeditor/skins/twopanels/icons.png}, %q{app/assets/javascripts/wymeditor/skins/twopanels/skin.css}, %q{app/assets/javascripts/wymeditor/skins/twopanels/skin.js}, %q{app/assets/javascripts/wymeditor/skins/wymeditor_icon.png}, %q{public/robots.txt}, %q{app/assets/stylesheets/comatose/admin.css}, %q{app/assets/stylesheets/comatose/base.css}, %q{spec/controllers/comatose/base_controller_spec.rb}, %q{spec/controllers/foos_controller_spec.rb}, %q{spec/helpers/foos_helper_spec.rb}, %q{spec/routing/base_routing_spec.rb}, %q{spec/spec_helper.rb}, %q{test/behaviors.rb}, %q{test/fixtures/comatose_pages.yml}, %q{test/functional/comatose_admin_controller_test.rb}, %q{test/functional/comatose_controller_test.rb}, %q{test/integration/comatose_routing_test.rb}, %q{test/javascripts/test.html}, %q{test/javascripts/test_runner.js}, %q{test/old_test_helper.rb}, %q{test/performance/browsing_test.rb}, %q{test/test_helper.rb}, %q{test/unit/class_options_test.rb}, %q{test/unit/comatose_page_test.rb}, %q{test/unit/processing_context_test.rb}, %q{test/unit/text_filters_test.rb}]
  s.homepage = %q{http://comatose-rubyisbeautiful.github.com/comatose-rubyisbeautiful/}
  s.post_install_message = %q{
======================
 Welcome to Comatose!
======================

From here you'll want to run:

  $ rails generate comatose
  $ rake db:migrate

  Add the default comatose routes to the top of your routes.rb file:

  routes_for_comatose
  admin_routes_for_comatose
}
  s.rdoc_options = [%q{--line-numbers}, %q{--inline-source}, %q{--title}, %q{Comatose-rubyisbeautiful}, %q{--main}, %q{README}]
  s.require_paths = [%q{lib}]
  s.rubyforge_project = %q{comatose-rubyisbeautiful}
  s.rubygems_version = %q{1.8.6}

  s.summary = %q{Micro CMS - resurrected for Rails 3}
  s.test_files = [%q{test/functional/comatose_admin_controller_test.rb}, %q{test/functional/comatose_controller_test.rb}, %q{test/integration/comatose_routing_test.rb}, %q{test/performance/browsing_test.rb}, %q{test/test_helper.rb}, %q{test/unit/class_options_test.rb}, %q{test/unit/comatose_page_test.rb}, %q{test/unit/processing_context_test.rb}, %q{test/unit/text_filters_test.rb}]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rake>, [">= 0.9.2"])
      s.add_runtime_dependency(%q<rails>, [">= 3.1.1"])
      s.add_runtime_dependency(%q<acts_as_versioned>, [">= 0"])
      s.add_runtime_dependency(%q<acts_as_list-rails3>, [">= 0"])
      s.add_runtime_dependency(%q<acts_as_tree_rails3>, [">= 0"])
      s.add_development_dependency(%q<term-ansicolor>, [">= 0"])
    else
      s.add_dependency(%q<rake>, [">= 0.9.2"])
      s.add_dependency(%q<rails>, [">= 3.1.1"])
      s.add_dependency(%q<acts_as_versioned>, [">= 0"])
      s.add_dependency(%q<acts_as_list-rails3>, [">= 0"])
      s.add_dependency(%q<acts_as_tree_rails3>, [">= 0"])
      s.add_dependency(%q<term-ansicolor>, [">= 0"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0.9.2"])
    s.add_dependency(%q<rails>, [">= 3.1.1"])
    s.add_dependency(%q<acts_as_versioned>, [">= 0"])
    s.add_dependency(%q<acts_as_list-rails3>, [">= 0"])
    s.add_dependency(%q<acts_as_tree_rails3>, [">= 0"])
    s.add_dependency(%q<term-ansicolor>, [">= 0"])
  end
end
