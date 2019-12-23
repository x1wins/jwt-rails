# README
jwt-rails project developed for helping Authenticate your rails rest-api project
you can fast develop project with jwt-rails
I used reference following websites
https://guides.rubyonrails.org/generators.html#creating-generators-with-generators
https://medium.com/binar-academy/rails-api-jwt-authentication-a04503ea3248

## Require
* You don't have User Model, It will generate User Model
* 'rails', '~> 3.2.0'

## Getting Started
1. Add gem in Gemfile
    ```yaml
    gem 'jwt-rails', '~> 0.0.1'
    ```
    OR
    ```yaml
    gem 'jwt-rails', :git => "git://github.com/x1wins/jwt-rails.git"
    ```

2. Generate JWT class, User Model, Endpoint
    ```bash
    rails generate jwt_rails
    ```

3. Endpoint
    1. Create User
    ```bash
      curl -d '{"name":"ChangWoo", "username":"helloworld", "email":"x1wins@changwoo.org", "password":"hello1234", "password_confirmation":"hello1234"}' -H "Content-Type: application/json" -X POST -i http://localhost:3000/users
    ```
    
4. Scaffold Example 
    1. Use ```user:references``` in scaffold code 
        ```bash
          rails g scaffold post body:string user:references published:boolean
        ```
    2. Insert ```before_action :authorize_request``` code into Controller
        ```bash
          class PostsController < ApplicationController
            before_action :authorize_request
            
            //...other code
            
          end
        ```