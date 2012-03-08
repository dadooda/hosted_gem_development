# Clone (vendorize) hosted development gems/plugins.
# Require this script in `boot.rb` before `Gemfile` is sourced:
#
#   require File.expand_path("../clone_hosted_gems", __FILE__)

verbose = STDOUT.tty?     # Verbose on TTYs, quiet otherwise.
#verbose = false           # Always quiet.

["gems", "plugins"].each do |subject|
  # List items to clone. Append "-" to directory name to have it skipped.
  items = begin
    # WARNING: chdir.
    Dir.chdir("vendor/#{subject}_dev") do
      Dir["*"].sort.select do |fn|
        File.directory?(fn) and not fn =~ /-\z/
      end
    end
  rescue Errno::ENOENT
    []
  end

  print "Cloning hosted #{subject}:" if verbose

  # NOTE: Use `system` here and below to see error messages, if any.
  system "mkdir -p vendor/#{subject}"

  # WARNING: chdir.
  Dir.chdir("vendor/#{subject}") do
    items.each do |item|
      print " #{item}" if verbose
      system "rm -rf --preserve-root #{item}"
      system "cp -r ../#{subject}_dev/#{item} ."
      system "rm -rf --preserve-root #{item}/.git"
    end
  end

  puts if verbose
end # [...].each do |subject|
