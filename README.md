
Hosted gem/plugin development infrastructure
============================================


Introduction
------------

Developing gems is often tricky because they act like separate projects with regard to the applications you use them in.

"Hosted" development infrastructure **makes gem development easier** by including them into (make them "hosted by") your live application.
Then you update your gem's code like you update regular application code.


Setup
-----

Add to your `Gemfile`:

~~~
gem "hosted_gem_development"
~~~

Install the gem:

~~~
$ bundle install
~~~

Generate essentials:

~~~
$ rails generate hosted_gem_development
~~~

Ensure `config/boot.rb` does this before the `Gemfile` line:

~~~
require File.expand_path("../clone_hosted_gems", __FILE__)
~~~

Ensure `.gitignore` contains the following:

~~~
/vendor/gems_dev/
/vendor/plugins_dev/
~~~

Check out the gem you are working on:

~~~
$ cd vendor/gems_dev
$ git clone git://github.com/author/cool_gem.git
~~~

Include the gem into your `Gemfile`:

~~~
gem "cool_gem", :path => "vendor/gems/cool_gem"
~~~


Now you can work on `vendor/gems_dev/cool_gem` like you do on regular
application code. Changes to the gem become **instantly available** to
the application whenever you load your Rails environment.


Copyright
---------

Copyright &copy; 2012 Alex Fortuna.

Licensed under the MIT License.


Feedback
--------

Send bug reports, suggestions and criticisms through [project's page on GitHub](http://github.com/dadooda/hosted_gem_development).
