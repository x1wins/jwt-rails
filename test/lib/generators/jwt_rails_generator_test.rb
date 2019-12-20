require 'test_helper'
require 'generators/jwt_rails/jwt_rails_generator'

class JwtRailsGeneratorTest < Rails::Generators::TestCase
  tests JwtRailsGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
