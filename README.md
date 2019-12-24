# README
jwt-rails project developed for helping Authenticate your rails rest-api project<br/>
you can fast develop project with jwt-rails<br/>
I used reference following websites<br/>
https://guides.rubyonrails.org/generators.html#creating-generators-with-generators <br/>
https://medium.com/binar-academy/rails-api-jwt-authentication-a04503ea3248 <br/>

## Require
* rails api only project ```rails new my_api --api``` https://guides.rubyonrails.org/api_app.html
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
    rake db:migrate
    ```

3. Endpoint
    1. Create User
        ```bash
          curl -d '{"user": {"name":"ChangWoo", "username":"helloworld", "email":"x1wins@changwoo.org", "password":"hello1234", "password_confirmation":"hello1234"}}' -H "Content-Type: application/json" -X POST -i http://localhost:3000/users
        ```
    2. Login
        ```bash
          curl -d '{"email":"x1wins@changwoo.org", "password":"hello1234"}' -H "Content-Type: application/json" -X POST http://localhost:3000/auth/login | jq
          {
            "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NzcyMjkwOTl9.an-cp7gWzEuufwvWPo3SFXzpxL_G1wvNpm6g7W_gdQU",
            "exp": "12-24-2019 15:11",
            "username": "helloworld"
          }
        ```
    3. Token Usage <br/>
        If you have Post scaffold. you can use following curl command 
        1. Fail Case - Wrong token
            ```bash
            curl -X GET -i http://localhost:3000/posts
            HTTP/1.1 401 Unauthorized
            ```
        2. Success Case
            ```bash
            curl -X GET -i http://localhost:3000/posts -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NzcyMjkwOTl9.an-cp7gWzEuufwvWPo3SFXzpxL_G1wvNpm6g7W_gdQU"
            HTTP/1.1 200 OK
            ```
    
4. Scaffold Example 
    1. Use ```user:references``` in scaffold code 
        ```bash
          rails g scaffold post body:string user:references published:boolean
        ```
    2. Authenticate <br/>
        Insert ```before_action :authorize_request``` code into Controller
        ```ruby
          class PostsController < ApplicationController
            before_action :authorize_request
            
            //...other code
            
          end
        ```
    3. Authorize <br/>
        https://stackoverflow.com/questions/17594939/check-if-current-user-is-the-owner-of-a-resource-and-allow-edit-delete-actions/57279448#57279448 <br/>
        1. Insert ```is_owner_object``` code into Controller <br/>
        2. Append ```merge(user_id: @current_user.id)``` to post_params method
            ```ruby
              class PostsController < ApplicationController
                before_action :authorize_request
                before_action :set_post, only: [:show, :update, :destroy]
                before_action only: [:edit, :update, :destroy] do
                  is_owner_object @post ##your object
                end
         
                //...other code
                
                def post_params
                    params.require(:post).permit(:body).merge(user_id: @current_user.id)
                end
              end
            ```
    4. Test with CURL
        1. Create
            ```bash
               curl  -X POST -i http://localhost:3000/posts -d '{"post": {"body":"sample body text sample"}}' -H "Content-Type: application/json" -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NzcyMzY1NTJ9.0pRv-wnQPdQd1WoaA5mSPDWagfGCk---kwO7pSmKkUg"
            ```
        2. Index
            ```bash
               curl -X GET -i http://localhost:3000/posts -H "Content-Type: application/json" -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NzcyMzY1NTJ9.0pRv-wnQPdQd1WoaA5mSPDWagfGCk---kwO7pSmKkUg"
            ```
        

## Contribute
How to build gem
```bash
gem build jwt-rails.gemspec
gem install jwt-rails-0.0.1.gem
```
