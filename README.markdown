# Comatose

* Version: 3.0.0 (beta)
* Author:  Bryan Taylor (originally written by Matt McCray)
* Website: github.com/rubyisbeautiful/comatose
* Email: artofobjects at gmail dot com


*Comatose* is a micro CMS designed for being embedded into existing Rails 
applications.

It's intended for simple CMS support. Comatose supports 

 * Nested pages
 * Versioning
 * Page markup in Textile, Markdown, RDoc, or easily add your own 
 * Page processing through Liquid or ERb
 * Generators for easy installation/migration
 * Self-contained gem containing a Rails::Engine
 * Code Editor for mark, designed by scienco.de (http://blog.scienceco.de/2011/06/19/einfacher-javascript-code-editor/)

It's meant to be lean, mean, easily embedded, and easy to re-skin for 
existing applications. If you need something more, I would recommend 
looking into Radiant, Mephisto, Refinery, BrowserCMS, or Locomotive.

For more information, see the [Getting Started][] guide.

### Requirements

 * Rails 3.0.x (3.0.9)
 * `acts_as_list-rails3`, `acts_as_tree_rails3`, and `liquid` gems are required (at the moment)


### Development Notes

*NOTE*: This is a port of Comatose, which was last maintained in 2008.  This
        branch of Comatose is built specifically for Rails 3.
        There is no legacy support.

 * Make comatose fully self-contained, which means removing `acts_as_(tree|list)`
 * Improve `ComatoseAdminController` to reduce number of DB calls for building the page tree
 * `Comatose.configure` needs to be an initializer (update docs)
 * Give access to all the default rails helpers to Comatose Pages by default?
 * UI refresh (nothing major, just some cleanup).
 * RESTful goodness.
 * Support XML/JSON responses from `ComatoseController` and `ComatoseAdminController`.
 * Support for static rendering (for generating sites like this blog).

### Installation

*Note*: See the 'Upgrading' section if you already have an older version of 
        the comatose plugin installed.

    $ gem install comatose
    $ rails generate comatose
    $ rake db:migrate
    $ rails server

Open your `routes.rb` and add the following:

    routes_for_comatose

That's it, you're ready to go! You should be able to browse to 
http://127.0.0.1:3000/en/comatose and start adding pages to your CMS.
Browsing to http://127.0.0.1:3000/en will render your comatose pages if
routing doesn't match any of your controllers. 


### Configuration

You configure Comatose in your `config/intializers/comatose.rb` file. Here is an example
configuration block:

    Comatose.configure do |config|
      # Sets the text in the Admin UI's title area
      config.admin_title = "Site Content"
      config.admin_sub_title = "Content for the rest of us..."
    end


### Extra Credit

This gem is based on the work of Matt McCray, and other original Comatose contributers,
as well as the following individuals, to whom Matt gave credit in the original README.markdown.
Following are the specific libraries that are distributed with Comatose. If I've
missed someone/something please let me know.

 * [Liquid][] by [Tobias Luetke][] 
 * [RedCloth][] by [_why][]
 * [Acts as Versioned][]  by [Rick Olsen][]
 * [Behaviors][] by Atomic Object LLC -- very nice BDD-like testing library

### Feedback

I’ve released Comatose under the MIT license. Which basically means you 
can use it however you want.

Don't forget to read the [Getting Started][] guide located on the RubyForge
project site.

If you like it, hate it, or have some ideas for new features, let me know!

artofobjects at gmail dot com


[Getting Started]: http://github.com/rubyisbeautiful/comatose
[Liquid]: http://home.leetsoft.com/liquid
[Tobias Luetke]: http://blog.leetsoft.com
[RedCloth]: http://whytheluckystiff.net/ruby/redcloth
[_why]: http://whytheluckystiff.net
[Acts as Versioned]: http://ar-versioned.rubyforge.org
[Rick Olsen]: http://weblog.techno-weenie.net
[Behaviors]: http://behaviors.rubyforge.org
