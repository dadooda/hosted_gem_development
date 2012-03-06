Gem::Specification.new do |s|
  s.name = "hosted_gem_development"
  s.version = "0.1.0"
  s.authors = ["Alex Fortuna"]
  s.email = ["alex.r@askit.org"]
  s.homepage = "http://github.com/dadooda/hosted_gem_development"

  # Copy these from class's description, adjust markup.
  s.summary = %q{T O D O}
  s.description = %q{T O D O: Lalala.}
  # end of s.description=

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map {|f| File.basename(f)}
  s.require_paths = ["lib"]
end
