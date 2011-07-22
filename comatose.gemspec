# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{comatose}
  s.version = "3.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.8.4") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Bryan Taylor, Matt McCray, Michael Kovacs}]
  s.date = %q{2011-07-21}
  s.description = %q{Web Content Management in Rails 3.}
  s.email = %q{btaylor39@csc.com}
  s.extra_rdoc_files = [%q{CHANGELOG}, %q{LICENSE}, %q{README}, %q{README.markdown}, %q{lib/comatose.rb}, %q{lib/comatose/configuration.rb}, %q{lib/comatose/drop.rb}, %q{lib/comatose/engine.rb}, %q{lib/comatose/locale_constraint.rb}, %q{lib/comatose/logger.rb}, %q{lib/comatose/page_wrapper.rb}, %q{lib/comatose/processing_context.rb}, %q{lib/comatose/routes.rb}, %q{lib/comatose/tasks/admin.rb}, %q{lib/comatose/tasks/data.rb}, %q{lib/comatose/tasks/setup.rb}, %q{lib/comatose/text_filters.rb}, %q{lib/comatose/version.rb}, %q{lib/generators/comatose/USAGE}, %q{lib/generators/comatose/comatose_generator.rb}, %q{lib/generators/comatose/templates/comatose.rb}, %q{lib/generators/comatose/templates/migration.erb}, %q{lib/generators/comatose/templates/seeds.erb}, %q{lib/support/class_options.rb}, %q{lib/support/inline_rendering.rb}, %q{lib/support/route_mapper.rb}, %q{lib/tasks/comatose.rake}, %q{lib/text_filters/markdown.rb}, %q{lib/text_filters/markdown_smartypants.rb}, %q{lib/text_filters/none.rb}, %q{lib/text_filters/rdoc.rb}, %q{lib/text_filters/simple.rb}, %q{lib/text_filters/textile.rb}]
  s.files = [%q{CHANGELOG}, %q{Gemfile}, %q{Gemfile.lock}, %q{INSTALL}, %q{LICENSE}, %q{README}, %q{README.markdown}, %q{Rakefile}, %q{SPECS}, %q{about.yml}, %q{app/controllers/application_controller.rb}, %q{app/controllers/comatose/admin_controller.rb}, %q{app/controllers/comatose/application_controller.rb}, %q{app/controllers/comatose/base_controller.rb}, %q{app/helpers/application_helper.rb}, %q{app/helpers/comatose/admin_helper.rb}, %q{app/helpers/comatose/application_helper.rb}, %q{app/helpers/comatose/base_helper.rb}, %q{app/models/comatose/page.rb}, %q{app/views/comatose/admin/_form.html.erb}, %q{app/views/comatose/admin/_page_list_item.html.erb}, %q{app/views/comatose/admin/delete.html.erb}, %q{app/views/comatose/admin/edit.html.erb}, %q{app/views/comatose/admin/index.html.erb}, %q{app/views/comatose/admin/new.html.erb}, %q{app/views/comatose/admin/reorder.html.erb}, %q{app/views/comatose/admin/versions.html.erb}, %q{app/views/layouts/application.html.erb}, %q{app/views/layouts/comatose/admin.html.erb}, %q{app/views/layouts/comatose/base.html.erb}, %q{config.ru}, %q{config/environment.rb}, %q{config/environments/development.rb}, %q{config/environments/production.rb}, %q{config/environments/test.rb}, %q{config/locales/en.yml}, %q{db/seeds.rb}, %q{install.rb}, %q{lib/comatose.rb}, %q{lib/comatose/configuration.rb}, %q{lib/comatose/drop.rb}, %q{lib/comatose/engine.rb}, %q{lib/comatose/locale_constraint.rb}, %q{lib/comatose/logger.rb}, %q{lib/comatose/page_wrapper.rb}, %q{lib/comatose/processing_context.rb}, %q{lib/comatose/routes.rb}, %q{lib/comatose/tasks/admin.rb}, %q{lib/comatose/tasks/data.rb}, %q{lib/comatose/tasks/setup.rb}, %q{lib/comatose/text_filters.rb}, %q{lib/comatose/version.rb}, %q{lib/generators/comatose/USAGE}, %q{lib/generators/comatose/comatose_generator.rb}, %q{lib/generators/comatose/templates/comatose.rb}, %q{lib/generators/comatose/templates/migration.erb}, %q{lib/generators/comatose/templates/seeds.erb}, %q{lib/support/class_options.rb}, %q{lib/support/inline_rendering.rb}, %q{lib/support/route_mapper.rb}, %q{lib/tasks/comatose.rake}, %q{lib/text_filters/markdown.rb}, %q{lib/text_filters/markdown_smartypants.rb}, %q{lib/text_filters/none.rb}, %q{lib/text_filters/rdoc.rb}, %q{lib/text_filters/simple.rb}, %q{lib/text_filters/textile.rb}, %q{public/404.html}, %q{public/422.html}, %q{public/500.html}, %q{public/favicon.ico}, %q{public/images/comatose/collapsed.gif}, %q{public/images/comatose/expanded.gif}, %q{public/images/comatose/no-children.gif}, %q{public/images/comatose/page.gif}, %q{public/images/comatose/rails.png}, %q{public/images/comatose/spinner.gif}, %q{public/images/comatose/title-hover-bg.gif}, %q{public/javascripts/comatose/admin.js}, %q{public/javascripts/comatose/application.js}, %q{public/javascripts/comatose/controls.js}, %q{public/javascripts/comatose/dragdrop.js}, %q{public/javascripts/comatose/effects.js}, %q{public/javascripts/comatose/prototype.js}, %q{public/javascripts/comatose/rails.js}, %q{public/robots.txt}, %q{public/stylesheets/comatose/admin.css}, %q{spec/controllers/comatose/base_controller_spec.rb}, %q{spec/controllers/foos_controller_spec.rb}, %q{spec/helpers/foos_helper_spec.rb}, %q{spec/routing/base_routing_spec.rb}, %q{spec/spec_helper.rb}, %q{test/behaviors.rb}, %q{test/fixtures/comatose_pages.yml}, %q{test/functional/comatose_admin_controller_test.rb}, %q{test/functional/comatose_controller_test.rb}, %q{test/integration/comatose_routing_test.rb}, %q{test/javascripts/test.html}, %q{test/javascripts/test_runner.js}, %q{test/old_test_helper.rb}, %q{test/performance/browsing_test.rb}, %q{test/test_helper.rb}, %q{test/unit/class_options_test.rb}, %q{test/unit/comatose_page_test.rb}, %q{test/unit/processing_context_test.rb}, %q{test/unit/text_filters_test.rb}, %q{views/layouts/comatose_admin.html.erb}, %q{views/layouts/comatose_admin_customize.html.erb}, %q{Manifest}, %q{comatose.gemspec}]
  s.homepage = %q{http://comatose.github.com/comatose/}
  s.post_install_message = %q{
======================
 Welcome to Comatose!
======================

Be sure and install the acts_as_tree and acts_as_list plugins!

From here you'll want to run:

  $ ./script/generate comatose_migration
  
NOTE: The generator will add the default comatose routes to the top of your routes.rb file. You'll want to move `map.comatose_root ''` to the bottom of your routes block.

When that's finished, run:

  $ rake db:migrate

That's it for the Comatose setup! 

Be sure to read the README file, and the 'Getting Started' guide. They are located at vendor/plugins/comatose/README and http://comatose.rubyforge.org/getting-started-guide respectively.
}
  s.rdoc_options = [%q{--line-numbers}, %q{--inline-source}, %q{--title}, %q{Comatose}, %q{--main}, %q{README}]
  s.require_paths = [%q{lib}]
  s.rubyforge_project = %q{comatose}
  s.rubygems_version = %q{1.8.5}
  s.summary = %q{Micro CMS - resurrected for Rails 3}
  s.test_files = [%q{test/functional/comatose_admin_controller_test.rb}, %q{test/functional/comatose_controller_test.rb}, %q{test/integration/comatose_routing_test.rb}, %q{test/performance/browsing_test.rb}, %q{test/test_helper.rb}, %q{test/unit/class_options_test.rb}, %q{test/unit/comatose_page_test.rb}, %q{test/unit/processing_context_test.rb}, %q{test/unit/text_filters_test.rb}]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rake>, [">= 0.9.2"])
      s.add_runtime_dependency(%q<rails>, [">= 3.0.9"])
      s.add_runtime_dependency(%q<acts_as_versioned>, [">= 0"])
      s.add_runtime_dependency(%q<acts_as_list-rails3>, [">= 0"])
      s.add_runtime_dependency(%q<acts_as_tree_rails3>, [">= 0"])
      s.add_development_dependency(%q<term-ansicolor>, [">= 0"])
    else
      s.add_dependency(%q<rake>, [">= 0.9.2"])
      s.add_dependency(%q<rails>, [">= 3.0.9"])
      s.add_dependency(%q<acts_as_versioned>, [">= 0"])
      s.add_dependency(%q<acts_as_list-rails3>, [">= 0"])
      s.add_dependency(%q<acts_as_tree_rails3>, [">= 0"])
      s.add_dependency(%q<term-ansicolor>, [">= 0"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0.9.2"])
    s.add_dependency(%q<rails>, [">= 3.0.9"])
    s.add_dependency(%q<acts_as_versioned>, [">= 0"])
    s.add_dependency(%q<acts_as_list-rails3>, [">= 0"])
    s.add_dependency(%q<acts_as_tree_rails3>, [">= 0"])
    s.add_dependency(%q<term-ansicolor>, [">= 0"])
  end
end
