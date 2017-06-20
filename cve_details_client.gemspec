# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "cve_details_client/version"

Gem::Specification.new do |spec|
  spec.name          = "cve_details_client"
  spec.license       = ""
  spec.version       = CveDetailsClient::VERSION
  spec.authors       = ["Adam Scarborough"]
  spec.email         = ["scarby2@gmail.com"]

  spec.summary       = 'client for cvedetails to retrieve the latest cve listings for a specific product'
  spec.homepage      = "https://github.com/scarby/cve_details_client"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency('rdoc')
  spec.add_development_dependency('aruba')
  spec.add_dependency('methadone', '~> 1.9.5')
  spec.add_development_dependency('test-unit')
  spec.add_dependency('nokogiri')
end
