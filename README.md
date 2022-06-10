
# <a href="https://gearupbeta.herokuapp.com" target="_blank">**Gear-UP**</a>

![languages](https://img.shields.io/github/languages/top/ShermanA-13/gear-up-fe?color=red)
![rspec](https://img.shields.io/gem/v/rspec?color=blue&label=rspec)
![simplecov](https://img.shields.io/gem/v/simplecov?color=blue&label=simplecov)<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/contributors-6-orange.svg?style=flat)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->

![heroku](https://img.shields.io/badge/Heroku-430098?style=for-the-badge&logo=heroku&logoColor=white)
![miro](https://img.shields.io/badge/Miro-050038?style=for-the-badge&logo=Miro&logoColor=white)
![postgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)

<hr>

<p align="center">
  <a href="https://gearupbeta.herokuapp.com" target="_blank"><img src="./imgs/gear_up_long_logo.png" alt="logo" width="80%"/></a>
</p>

<hr>

## **Background and Description**
<a href="https://gearupbeta.herokuapp.com" target="_blank">**Gear-UP**</a><br><br>
Logistics for group adventures outdoors can be complicated, especially when it comes to getting all of your gear in order. __Gear Up__ simplifies this by giving users a platform to easily organize trips, decide who is bringing what gear, then determine what the group still needs and who might have that gear already!

Using __Gear Up__, users are able to:

- Register or sign-in using Google OAuth
- Add items to their __"shed"__, a list of __all gear__ that user has available
- Search for and select a __location__ for your trip
  - In doing the step above, determine the __weather__, allowing the user to think on what gear is needed
- __Invite other users__ to the trip
- The host as well as all invited users can then __select what gear__ from their __"shed"__ they'd like to __commit to the trip__
- From there, users can determine what gear is __already covered__ and what gear is __still missing__ based on what the users have __already committed__!
-[Gear UP FE](https://github.com/ShermanA-13/gear-up-fe) web application that uses [Gear Up BE](https://github.com/ShermanA-13/gear-up-be) is the "Back End" application that acts as a microservice.
- [Consultancy Competition](https://backend.turing.edu/module3/projects/consultancy)
- [MiroBoard](https://miro.com/app/board/uXjVOw873iE=/?share_link_id=273903554758)

## **Table of Contents**
- [Background and Description](#background-and-description)
- [Schema](#schema)
- [Learning Goals](#learning-goals)
- [Requirements and Setup (for Mac):](#requirements-and-setup-for-mac)
    - [Ruby and Rails Versions](#ruby-and-rails-versions)
    - [Gems Utilized](#gems-utilized)
    - [APIs](#apis-consumed)
    - [SetUp](#setup)
- [Heroku Setup](#heroku-setup)
- [Endpoints](#endpoints-provided)
- [Contributors](#contributors-)

## Schema
<p align="center">
  <img src="./imgs/gear_up_schema.png" alt="schema" width="80%"/>
</p>


## **Learning Goals**
### [Consultancy Competition](https://backend.turing.edu/module3/projects/consultancy/)
Our “Back End” application will be an API built in Rails. It will act as the interface layer to our database, and it will handle our API consumption.
```
* Rails “front end”
  * If in Rails, this is a typical rails new project
  * It will have simple feature testing, and will mostly focus onView templates, HTML and CSS. We highly recommend Bootstrap
  * This application is responsible for authentication via OAuth
    * Try to find a way to utilize your user’s OAuth token within the application in some way
      * eg, if you OAuth with Google, what can we use their OAuth token to do on their behalf at Google?
  * This application is only allowed to store user data in a local database (although you can choose to store user data on the backend instead)
    * This app’s database can only have a “users” table
    * All other database storage must go through a “DatabaseService” that you implement to do any CRUD behavior on your Backend
      * This will follow the typical Facade and Service design patterns
      * You will need HEAVY use of webmock to test expected results until the backend endpoints are finished. 
        Planning the structure of your JSON ahead of time will go a long way in allowing both applications to proceed in a decoupled manner asynchronously
      * Once the backend endpoints are finished, consider changing to VCR
  * Extension: using caching to cache responses retrieved from the backend application
```


## **Requirements and Setup (for Mac):**

### **Ruby and Rails Versions**
---
- Ruby Version 2.7.4
- Rails Version 5.2.8

### **Gems Utilized**
---
- [bootstrap](https://getbootstrap.com/docs/4.0/getting-started/introduction/)
- [capybara](https://github.com/teamcapybara/capybara)
- [faker](https://github.com/faker-ruby/faker)
- [factory_bot](https://github.com/thoughtbot/factory_bot_rails)
- [faraday](https://github.com/lostisland/faraday)
- [figaro](https://github.com/laserlemon/figaro)
- [jquery-rails](https://github.com/rails/jquery-rails)
- [jsonapi-serializer](https://github.com/jsonapi-serializer/jsonapi-serializer)
- [launchy](https://github.com/copiousfreetime/launchy)
- [orderly](https://github.com/jmondo/orderly)
- [pry](https://github.com/pry/pry)
- [rspec_junit_formatter](https://github.com/sj26/rspec_junit_formatter)
- [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)
- [simplecov](https://github.com/simplecov-ruby/simplecov)
- [simple_form](https://github.com/heartcombo/simple_form)
- [tether-rails](https://www.rubydoc.info/gems/tether-rails/1.4.0)
- [rspec](https://relishapp.com/rspec)
- [vcr](https://github.com/vcr/vcr)
- [webmock](https://github.com/bblimke/webmock)

## **APIs Consumed**
- [OpenWeather](https://openweathermap.org/api)
- [GoogleMaps](https://developers.google.com/maps)
- [Google OAuth 2.0](https://developers.google.com/identity/protocols/oauth2)
## **Setup**
1. Create a Base Directory
* On your local machine open a terminal session and enter the following commands to create a base directory for the app.

```shell
$ mkdir gear_up
$ cd gear_up
```

2. Clone these repositories:
* On your local machine open a terminal session and enter the following commands for SSH or HTTPS to clone the [front end](#background-and-description) repositiory.


- using ssh key <br>
```shell
$ git clone git@github.com:ShermanA-13/gear-up-fe.git
```

- using https <br>
```shell
$ git clone https://github.com/ShermanA-13/gear-up-fe.git
```

* Once cloned, enter the following commands for SSH or HTTPS to clone the [back end](#background-and-description) repositiory.

- using ssh key <br>
```shell
$ git clone git@github.com:ShermanA-13/gear-up-be.git
```

- using https <br>
```shell
$ git clone https://github.com/ShermanA-13/gear-up-be.git
```

* Once cloned, you'll have a new local copies of the directories you ran the clone command in. You can check what is in the directory by running the following command<br>

```sh
$ ls
#ex.
  gear-up-be gear-up-fe
```

3. Change to the project directory:<br>
In terminal, use `$ cd` to navigate to the front end application project directory.

```shell
$ cd gear-up-fe
```

4. Install required Gems utilizing Bundler: <br>
In terminal, use Bundler to install any missing Gems. If Bundler is not installed, first run the following command.

```shell
$ gem install bundler
```

* If Bundler is already installed or after it has been installed, run the following command.

```shell
$ bundle install
```

* There should be be verbose text diplayed of the installation process that looks similar to below. (this is not an actual copy of what will be output).
<details>
<summary><b>Click to see example!</b></summary>
<p>

```shell
$ bundle install
Fetching gem metadata from https://rubygems.org/...........
Fetching gem metadata from https://rubygems.org/.
Resolving dependencies...
Using rake 13.0.6
Using concurrent-ruby 1.1.10
...
...
...
Using simplecov_json_formatter 0.1.4
Using simplecov 0.21.2
Using spring 2.1.1
Using spring-watcher-listen 2.0.1
Using standard 1.12.1
Bundle complete! 23 Gemfile dependencies, 94 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.
```

</p>
</details></br>

* If there are any errors, verify that bundler, Rails, and your ruby environment are correctly setup.

5. Figaro installation<br>

* Follow the [figaro](https://github.com/laserlemon/figaro) installation with the docs and get your [googlemaps.org](#apis-consumed) and [google client](#apis-consumed) keys. Add the google maps and google client keys to your newly created `config/application.yml` file and add it to your `.gitignore` file. Be sure to read the [google API docs](https://developers.google.com/docs/api) for a deeper undestanding of the app.

```sh
$ bundle exec figaro install
```

6. Startup and Access<br>
<p>
  In `/config/puma.rb`, you'll notice that the port has 3000. This should be on or around line 12.
</p>

```ruby
port  ENV.fetch("PORT") { 3000 }
```

<p>
  We do this because [Gear Up BE](https://github.com/ShermanA-13/gear-up-be) is not in production or hosted somewhere other than localhost. If Gear Up BE is running on `port 5000`, our front end will need to have a different port so they can run at the same time. Now, when we do `rails s`, our back end application will automatically use port 3000. You can also do this manually every time you start your server by passing the port number with a `-p` flag like so:
</p>

```sh
`rails s -p 3000`.
```

* You should see that your server is `"listening on tcp://localhost:3000"` now if it was different.


**In order for your frontend to properly get data from your backend Gear Up API, you must keep your backend server running locally at the same time.**

* Finally, in order to use the web app you will have to start the both Gear Up BE and Gear Up FE servers
- Start the back end server

```shell
$ rails s
```

<details>
<summary><b>Click to see example!</b></summary>
<p>

```shell
=> Booting Puma
=> Rails 5.2.8 application starting in development
=> Run `rails server -h` for more startup options
Puma starting in single mode...
* Version 3.12.6 (ruby 2.7.2-p137), codename: Llamas in Pajamas
* Min threads: 5, max threads: 5
* Environment: development
* Listening on tcp://localhost:3000
Use Ctrl-C to stop
```

</p>
</details></br>

* Switch to a new tab `CMD + T` in your terminal then navigate to the front end directory with the command:

```sh
$ cd ../gear-up-be
```

* Your file patch in your new tab in terminal should be `./gear_up/gear-up-be`. Start the front end server

```sh
$ rails s
```

<details>
<summary><b>Click to see example!</b></summary>
<p>

```shell
=> Booting Puma
=> Rails 5.2.8 application starting in development
=> Run `rails server -h` for more startup options
Puma starting in single mode...
* Version 3.12.6 (ruby 2.7.2-p137), codename: Llamas in Pajamas
* Min threads: 5, max threads: 5
* Environment: development
* Listening on tcp://localhost:5000
Use Ctrl-C to stop
```

</p>
</details></br>

* Open web browser and visit link to access the front end application
    http://localhost:3000

* At this point you should be taken an index page with clickable links to different data sets with the ability to create, read, update, and delete data.

## **Heroku Setup**
* If this is your first time setting up a Heroku server. Take your time to read these documents [Heroku Getting Started w/ Rails](https://devcenter.heroku.com/articles/getting-started-with-rails5) to familiarize yourself.<br>

1. [Deploy Application to Heroku](https://devcenter.heroku.com/articles/getting-started-with-rails5#deploy-your-application-to-heroku) is where you want to be after an account is created because your app already exists. You want to repeat the process for the front end application as well. You can check if your app is added on heroku with this command:

```sh
$ git remote -v
```
<details>
<summary><b>Click to see example!</b></summary>
<p>

```shell
heroku	https://git.heroku.com/<your app name>.git (fetch)
heroku	https://git.heroku.com/<your app name>.git (push)
origin	git@github.com:<your github username>/gear-up-be.git (fetch)
origin	git@github.com:<your github username>/gear-up-be.git (push)
```

</p>
</details></br>

* If your terminal doesn't reflect the example above input this command

```sh
$ heroku git:remote -a <yourapp>
```

2. Deploy your code:
```sh
$ git push heroku main
```

4. Ensure your API keys are set up on your web app
```
From your Heroku dashboard, click on the project you just created, then Settings. In the Config Vars section, click Reveal Config Vars. Here, you can add any API keys with the constant name you gave them in the application.yml file created from the figaro gem.
```
## **Endpoints Provided**

<details>
<summary><b>Click to see example!</b></summary>
<p>

```sh
                    Prefix Verb   URI Pattern                                          Controller#Action
                       root GET    /                                                    landing#index
auth_google_oauth2_callback GET    /auth/google_oauth2/callback(.:format)               users#create
                  dashboard GET    /dashboard(.:format)                                 dashboard#show
                      login GET    /login(.:format)                                     sessions#create
                     logout GET    /logout(.:format)                                    sessions#destroy
                 user_trips GET    /users/:user_id/trips(.:format)                      trips#index
                            POST   /users/:user_id/trips(.:format)                      trips#create
                 user_items GET    /users/:user_id/items(.:format)                      items#index
                            POST   /users/:user_id/items(.:format)                      items#create
              new_user_item GET    /users/:user_id/items/new(.:format)                  items#new
             edit_user_item GET    /users/:user_id/items/:id/edit(.:format)             items#edit
                  user_item GET    /users/:user_id/items/:id(.:format)                  items#show
                            PATCH  /users/:user_id/items/:id(.:format)                  items#update
                            PUT    /users/:user_id/items/:id(.:format)                  items#update
                            DELETE /users/:user_id/items/:id(.:format)                  items#destroy
                      users GET    /users(.:format)                                     users#index
                       user GET    /users/:id(.:format)                                 users#show
                      areas GET    /areas(.:format)                                     areas#index
                            GET    /areas/:id(.:format)                                 areas#show
                            GET    /areas/:area_id/trips/new(.:format)                  trips#new
                            GET    /trips/:trip_id/items(.:format)                      trip_items#new
                            POST   /trips/:trip_id/items(.:format)                      trip_items#create
                            PATCH  /trips/:trip_id/items(.:format)                      trip_items#update
                  edit_trip GET    /trips/:id/edit(.:format)                            trips#edit
                       trip GET    /trips/:id(.:format)                                 trips#show
                            PATCH  /trips/:id(.:format)                                 trips#update
                            PUT    /trips/:id(.:format)                                 trips#update
                            DELETE /trips/:id(.:format)                                 trips#destroy
                            GET    /areas/:area_id/trips/:trip_id/users/new(.:format)   trip_users#new
                            GET    /areas/:area_id/trips/new(.:format)                  trips#new
                            POST   /users/:user_id/trips/new(.:format)                  trips#create
                            GET    /trips/:trip_id/users(.:format)                      trip_users#edit
                            POST   /trips/:trip_id/users(.:format)                      trip_users#create
                            PATCH  /trips/:trip_id/users(.:format)                      trip_users#update
                            GET    /trips/:trip_id/items(.:format)                      trip_item#new
```

</p>
</details></br>

## **Contributors ✨**

Thanks go to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>

  <tr>

   <td align="center"><a href="https://github.com/ShermanA-13"><img src="https://avatars.githubusercontent.com/u/95321606?s=400&u=90b2d52424bfbec5411b711901d4789f2e40c470&v=4" width="100px;" alt=""/><br /><sub><b>Sherman A. (he/him)</b></sub></a><br /><a href="https://www.linkedin.com/in/sherman-au-2b4a69142/" title ="Linked In"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" /></a><br /><a href="https://github.com/ShermanA-13/gear-up-fe/commits?author=ShermanA-13" title="Code">💻</a> <a href="" title="Ideas, Planning, & Feedback">�</a> <a href="" title="Tests">⚠️</a> <a href="https://github.com/ShermanA-13/gear-up-fe/pulls?q=is%3Apr+author%3AShermanA-13" title="Reviewed Pull Requests">👀</a></td>

   <td align="center"><a href="https://github.com/sueboyd922"><img src="https://avatars.githubusercontent.com/u/96309924?v=4" width="100px;" alt=""/><br /><sub><b>Susan B. (she/her)</b></sub></a><br /><a href="https://www.linkedin.com/in/susan-boyd-6ba8749b/" title ="Linked In"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" /></a><br /><a href="https://github.com/ShermanA-13/gear-up-fe/commits?author=sueboyd922" title="Code">💻</a> <a href="" title="Ideas, Planning, & Feedback">�</a> <a href="" title="Tests">⚠️</a> <a href="https://github.com/ShermanA-13/gear-up-fe/pulls?q=is%3Apr+author%3Asueboyd922" title="Reviewed Pull Requests">👀</a></td>

   <td align="center"><a href="https://github.com/phillipkamps/landing_page"><img src="https://avatars.githubusercontent.com/u/56653844?v=4" width="100px;" alt=""/><br /><sub><b>Phillp K. (he/him)</b></sub></a><br /><a href="https://www.linkedin.com/in/phillip-kamps/" title ="Linked In"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" /></a><br /><a href="https://github.com/ShermanA-13/gear-up-fe/commits?author=phillipkamps" title="Code">💻</a> <a href="" title="Ideas, Planning, & Feedback">�</a> <a href="" title="Tests">⚠️</a> <a href="https://github.com/ShermanA-13/gear-up-fe/pulls?q=is%3Apr+author%3Aphillipkamps" title="Reviewed Pull Requests">👀</a></td>

   <td align="center"><a href="https://github.com/sandisz-d734m37"><img src="https://avatars.githubusercontent.com/u/94508708?v=4" width="100px;" alt=""/><br /><sub><b>Sandiz T. (he/him)</b></sub></a><br /><a href="https://www.linkedin.com/in/sandisz-thieme-25335316a/" title ="Linked In"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" /></a><br /><a href="https://github.com/ShermanA-13/gear-up-fe/commits?author=sandisz-d734m37" title="Code">💻</a> <a href="" title="Ideas, Planning, & Feedback">�</a> <a href="" title="Tests">⚠️</a> <a href="https://github.com/ShermanA-13/gear-up-fe/pulls?q=is%3Apr+author%3Asandisz-d734m37" title="Reviewed Pull Requests">👀</a></td>

   <td align="center"><a href="https://github.com/johnny-bowman"><img src="https://avatars.githubusercontent.com/u/95893959?v=4" width="100px;" alt=""/><br /><sub><b>Johnny B. (he/him)</b></sub></a><br /><a href="https://www.linkedin.com/in/johnnybowmansoftware/" title ="Linked In"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" /></a><br /><a href="https://github.com/ShermanA-13/gear-up-fe/commits?author=johnny-bowman" title="Code">💻</a> <a href="" title="Ideas, Planning, & Feedback">�</a> <a href="" title="Tests">⚠️</a> <a href="https://github.com/ShermanA-13/gear-up-fe/pulls?q=is%3Apr+author%3Ajohnny-bowman+" title="Reviewed Pull Requests">👀</a></td>

   <td align="center"><a href="https://github.com/AliciaWatt"><img src="https://avatars.githubusercontent.com/u/81201783?v=4" width="100px;" alt=""/><br /><sub><b>Alicia W. (she/her)</b></sub></a><br /><a href="https://www.linkedin.com/in/alicia-watt-3bb815225/" title ="Linked In"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" /></a><br /><a href="https://github.com/ShermanA-13/gear-up-fe/commits?author=AliciaWatt" title="Code">💻</a> <a href="" title="Ideas, Planning, & Feedback">�</a> <a href="" title="Tests">⚠️</a> <a href="https://github.com/ShermanA-13/gear-up-fe/pulls?q=is%3Apr+author%3AAliciaWatt" title="Reviewed Pull Requests">👀</a></td>


  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification.
<!--
