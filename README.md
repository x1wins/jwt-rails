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
    2. Login
        ```bash
          curl -d '{"email":"x1wins@changwoo.org", "password":"hello1234"}' -H "Content-Type: application/json" -X POST http://localhost:3000/auth/login | jq
          {
            "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NzcyMjkwOTl9.an-cp7gWzEuufwvWPo3SFXzpxL_G1wvNpm6g7W_gdQU",
            "exp": "12-24-2019 15:11",
            "username": "helloworld"
          }
        ```
    3. Token Usage
        If you have Post scaffold. you can use following curl command 
        1. Fail Case - Wrong token
            ```bash
            curl -X GET -i http://localhost:3000/posts
            HTTP/1.1 401 Unauthorized
            X-Frame-Options: SAMEORIGIN
            X-XSS-Protection: 1; mode=block
            X-Content-Type-Options: nosniff
            X-Download-Options: noopen
            X-Permitted-Cross-Domain-Policies: none
            Referrer-Policy: strict-origin-when-cross-origin
            Content-Type: application/json; charset=utf-8
            Cache-Control: no-cache
            X-Request-Id: 4dd54eac-e047-4cd6-acf1-1a65a7892bb2
            X-Runtime: 0.004087
            Transfer-Encoding: chunked
            ```
        2. Success Case
            ```bash
            curl -X GET -i http://localhost:3000/posts -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NzcyMjkwOTl9.an-cp7gWzEuufwvWPo3SFXzpxL_G1wvNpm6g7W_gdQU"
            HTTP/1.1 200 OK
            X-Frame-Options: SAMEORIGIN
            X-XSS-Protection: 1; mode=block
            X-Content-Type-Options: nosniff
            X-Download-Options: noopen
            X-Permitted-Cross-Domain-Policies: none
            Referrer-Policy: strict-origin-when-cross-origin
            Content-Type: application/json; charset=utf-8
            ETag: W/"4f53cda18c2baa0c0354bb5f9a3ecbe5"
            Cache-Control: max-age=0, private, must-revalidate
            X-Request-Id: b7ba9e96-bf9b-494e-81c6-f4b187751611
            X-Runtime: 0.016433
            Transfer-Encoding: chunked
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