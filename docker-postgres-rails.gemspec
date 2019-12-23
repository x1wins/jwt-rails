Gem::Specification.new do |s|
  s.name        = "docker-postgres-rails"
  s.version     = "0.0.1"
  s.date        = "2019-12-19"
  s.summary     = "JWT, user resource for Auth rest api generator"
  s.description = "Generate JWT, User model, controller"
  s.authors     = ["Chang-Woo Rhee"]
  s.email       = "x1wins@changwoo.net"
  s.files        = Dir.glob("{lib}/**/*") + %w(README.md)
  s.require_paths = ["lib"]
  s.add_development_dependency 'rails', '~> 3.2.0'
  s.homepage    = "https://github.com/x1wins/jwt-rails"
  s.metadata = {
      "homepage_uri"      => "https://www.changwoo.org",
      "source_code_uri"   => "https://github.com/x1wins/jwt-rails"
  }
  s.license     = "MIT"
end
