# README
## Mans Best Friend Fitness

This is an app where a User(A human with a dog) can monitor their dog to understand their wants and needs. I wanted to be able to have a record of this incase it was ever important for their Veterinarian/Trainer/Self to know. I hope that this application can help someone feel closer to their dogs. Dogs are family and I want to give them a voice. 

## Getting started

To get the Rails server running locally:

-The first step in this getting this app working is getting a facebook KEY and SECRET. 

    -https://developers.facebook.com/


    -login/signup

        -add new app

    -Once the key and secret are created, add these to a .env file with the following format:

        -FACEBOOK_KEY = 
        -FACEBOOK_SECRET = 

    -This will allow omniauth for github to work
    
    -Add .env to .gitignore file

    
-Clone this repo

-bundle install to install all req'd dependencies

-rake db:migrate to make all database migrations

-rails s to start the local server

## Dependencies

-Devise - For implementing authentication (https://github.com/heartcombo/devise)

-Omniauth - User sign-in/sign-up  (https://github.com/omniauth/omniauth)

-Dotenv Rails - For adding local enviorment file (https://github.com/bkeepers/dotenv)

-CanCanCan - For authorization, restricts what resources a given user is allowed to access. (https://github.com/CanCanCommunity/cancancan)

## Folders

app/models - Contains the database models for the application where we can define methods, validations, queries, and relations to other models.

app/views - Contains templates for pages presented to user

app/controllers - Contains the controllers where requests are routed to their actions, where we find and manipulate our models and return them for the 
views to render.

config - Contains configuration files for our Rails application and for our database, along with an initializers folder for scripts that get run on boot.

db - Contains the migrations needed to create our database schema.
