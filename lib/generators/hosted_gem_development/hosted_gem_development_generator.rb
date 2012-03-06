class HostedGemDevelopmentGenerator < Rails::Generators::Base   #:nodoc:
  source_root File.expand_path("../templates", __FILE__)

  def go
    copy_file (bn = "clone_hosted_gems.rb"), "config/#{bn}"
    # NOTE: It's possible to check the insertion status, but we'd better output the complete INSTALL anyway.
    insert_into_file "config/boot.rb", %{require File.expand_path("../clone_hosted_gems", __FILE__)\n\n}, :before => "# Set up gems listed in the Gemfile.\n"
    append_to_file ".gitignore", "/vendor/gems_dev/\n/vendor/plugins_dev/\n"
    empty_directory "vendor/gems_dev"
    empty_directory "vendor/plugins_dev"
    readme "INSTALL"
  end
end
