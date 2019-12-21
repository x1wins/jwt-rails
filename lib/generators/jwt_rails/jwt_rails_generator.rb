class JwtRailsGenerator < Rails::Generators::Base
  source_root File.expand_path('templates', __dir__)

  def copy_jwt_rails_file
    # # Use Json Web Token (JWT) for token based authentication
    # gem 'jwt'
    # # Use ActiveModel has_secure_password
    # gem 'bcrypt', '~> 3.1.7'
    #
    # route "resources :users, param: :_username"
    # route "post '/auth/login', to: 'authentication#login'"
    # route "get '/*a', to: 'application#not_found'"

    # copy_file "json_web_token.rb", "lib/json_web_token.rb"
    # copy_file "application_controller.rb", "app/controllers/application_controller.rb"
    #
    # generate "model", "user name:string username:string email:string password_digest:string"
    copy_file "user.rb", "app/models/user.rb"
    # generate "controller", "users"
    # copy_file "users_controller.rb", "app/controllers/users_controller.rb"
    # generate "controller", "authentication"
    # copy_file "authentication_controller.rb", "app/controllers/authentication_controller.rb"
    #
    # rake "db:migrate"
    puts "hello world"
  end

end
