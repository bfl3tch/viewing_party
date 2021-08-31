<h1 align="center">
   Welcome to Virtual Watch Party
</h1>

  [![Contributors][contributors-shield]][contributors-url]
  [![Issues][issues-shield]][issues-url]
  [![Stargazers][stars-shield]][stars-url]
  [![Forks][forks-shield]][forks-url]
<h3 align="center">
  The application that brings people together
</h3>
<h4 align="center">
  But keeps them apart
</h4>

  Find the [project spec here](https://backend.turing.edu/module3/projects/viewing_party/index).
  ## Table of Contents

  - [Overview](#overview)
  - [Tools Utilized](#tools-used)
  - [Contributing](#contributors)
  - [Setup](#setup)

  ### <ins align="center">Overview</ins>

  [Virtual Watch Party](https://virtual-watch-party.herokuapp.com/) is a 10-day, 2 person project, during Mod 3 of 4 for Turing School's Back End Engineering Program.

  We created an application that consumes a movie database 3rd party API and allows users to login, add friends, search for movies, get a list of recommended movies, see details about each movie, and add their friends to `Virtual-Watch-Parties` which are "dates" to all watch the chosen movie at an agreed upon time.

  <p align="center">
    <img src="https://user-images.githubusercontent.com/74567704/131438329-1ea0d25f-41b3-4226-98b1-56efb570a5ec.png" alt="top_rated_movies_page"/>
  </p>

  - ⭐ Consume JSON APIs that require authentication
  - ⭐ Build an application that requires basic authentication
  - ⭐ Organize and refactor code to be more maintainable
  - ⭐ Implement a self-referential relationship in ActiveRecord
  - ⭐ Utilize Continuous Integration using Travis CI
  - ⭐ Deploy to Heroku
  - ⭐ Apply principles of flow control across multiple methods
  - ⭐ Write migrations to create tables with columns of varying data types and foreign keys
  - ⭐ Use Rails to create web pages that allow users to CRUD resources
  - ⭐ Create instance and class methods on a Rails model that use ActiveRecord methods and helpers
  - ⭐ Write model and feature tests that fully cover data logic and potential user behavior
  - ⭐ Apply RuboCop’s style guide for code quality

  ![Schema Layout](https://user-images.githubusercontent.com/74567704/131439838-b4676308-58f6-4471-9b61-760dd16308b7.png)

  [Technical Requirements](https://backend.turing.edu/module3/projects/viewing_party/requirements)

  ### <ins>Tools Used</ins>

  |Development|Development|Testing|Deployment
  |--- |--- |--- |--- |
  |[Ruby 2.7.2](https://www.ruby-lang.org/en/downloads/)|[Bootstrap](https://rubygems.org/gems/bootstrap/versions/4.0.0)|[RSpec for Rails](https://github.com/rspec/rspec-rails)|[Heroku](http://virtual-watch-party.herokuapp.com)|
  |[Pry](https://rubygems.org/gems/pry/versions/0.10.3)|[Github](https://desktop.github.com/)|[Capybara](https://github.com/teamcapybara/capybara)|[Travis CI](https://travis-ci.org/)|
  |[Rails 5.2.6](https://rubygems.org/gems/rails/versions/5.2.6)|[Git](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup)|[Webmock](https://github.com/bblimke/webmock)
  |[PostgresQL](https://www.postgresql.org/)|[HTML](https://developer.mozilla.org/en-US/docs/Web/HTML)|[VCR](https://github.com/vcr/vcr)
  |[BCrypt](https://github.com/pyca/bcrypt)|[CSS](https://developer.mozilla.org/en-US/docs/Web/CSS)|[Launchy](https://rubygems.org/gems/launchy/versions/2.4.3)
  |[Postico](https://eggerapps.at/postico/)|[Rubocop](https://rubygems.org/gems/rubocop/versions/0.39.0)|[Orderly](https://github.com/jmondo/orderly)
  |[Faraday](https://github.com/lostisland/faraday)|[Atom](https://atom.io/)|[SimpleCov](https://rubygems.org/gems/simplecov/versions/0.12.0)
  |[Figaro](https://github.com/laserlemon/figaro)|[FactoryBot](https://github.com/thoughtbot/factory_bot)
  |[Postman](https://www.postman.com/product/rest-client/)|
















  ### <ins>Contributors</ins>

  👤  **Brian Fletcher**
  - Github: [Brian Fletcher](https://github.com/bfl3tch)
  - LinkedIn: [Brian Fletcher](https://www.linkedin.com/in/bfl3tch)

  👤  **Jason Knoll**
  - Github: [Jason Knoll](https://github.com/JasonPKnoll)
  - LinkedIn: [Jason Knoll](https://www.linkedin.com/in/jason-p-knoll/)


  <!-- MARKDOWN LINKS & IMAGES -->

  [contributors-shield]: https://img.shields.io/github/contributors/bfl3tch/viewing_party.svg?style=flat-square
  [contributors-url]: https://github.com/bfl3tch/viewing_party/graphs/contributors
  [forks-shield]: https://img.shields.io/github/forks/bfl3tch/viewing_party.svg?style=flat-square
  [forks-url]: https://github.com/bfl3tch/viewing_party/network/members
  [stars-shield]: https://img.shields.io/github/stars/bfl3tch/viewing_party.svg?style=flat-square
  [stars-url]: https://github.com/bfl3tch/viewing_party/stargazers
  [issues-shield]: https://img.shields.io/github/issues/bfl3tch/viewing_party.svg?style=flat-square
  [issues-url]: https://github.com/bfl3tch/viewing_party/issues
  <!--


  # README

  This README would normally document whatever steps are necessary to get the
  application up and running.

  Things you may want to cover:

  * Ruby version

  * System dependencies

  * Configuration

  * Database creation

  * Database initialization

  * How to run the test suite

  * Services (job queues, cache servers, search engines, etc.)

  * Deployment instructions

  * ... -->


  ##### A note about friendships
  ###### The user story about adding friends states that if User A and User B are in the database and User A adds User B as a friend, then that friendship is confirmed, and User A can now invite User B to a Viewing Party. It does not explicitly state that User B must also add User A as a friend. Think of this like a Twitter “follow” relationship: if I follow you, I can invite you to a Viewing Party, but you can’t invite me to a party unless you follow me first.

  ## <ins>Setup</ins>

  This project requires Ruby 2.7.2.

  * Fork this repository
  * Clone your fork
  * From the command line, install gems and set up your DB:
      * `bundle`
      * `rails db:create`
  * Run the test suite with `bundle exec rspec`.
  * Run your development server with `rails s` to see the app in action.

  #### Project Configurations

  * Ruby version
      ```bash
      $ ruby -v
      ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-darwin20]
      ```

  * [System dependencies](https://github.com/bfl3tch/viewing_party/blob/main/Gemfile)
      ```bash
      $ rails -v
      Rails 5.2.6
      ```

  * [API access](https://developers.themoviedb.org/3/getting-started/introduction)
      ```visit https://developers.themoviedb.org/3/getting-started/introduction
      - Signup for an account
      - To register for an API key, click the  from within your account settings page.
        - Click on your avatar or initials in the main navigation
        - Click the "Settings" link
        - Click the "API" link in the left sidebar
        - Click "Create" or "click here" on the API page
      - We will be using the `v4` token.
      ```

  * [API access setup](https://github.com/laserlemon/figaro)
      ```bash
      $ gem install figaro
      $ bundle exec figaro install
      open the new hidden file `application.yml`
      set `movie_api_key: <<Bearer (your bearer token)>>`
      Rails 5.2.6
      ```

  * Database creation
      ```bash
      $ rails db:{drop,create,migrate,seed}
      Created database 'viewing_party_development'
      Created database 'viewing_party_test'
      ```

  * How to run the test suite
      ```bash
      $ bundle exec rspec
      ```

  * [Local Deployment](http://localhost:3000), for testing:
      ```bash
      $ rails s
      => Booting Puma
      => Rails 5.2.6 application starting in development
      => Run `rails server -h` for more startup options
      Puma starting in single mode...
      * Version 3.12.6 (ruby 2.7.2-p137), codename: Llamas in Pajamas
      * Min threads: 5, max threads: 5
      * Environment: development
      * Listening on tcp://localhost:3000
      Use Ctrl-C to stop

      ```

  * [Heroku Deployment](https://virtual-watch-party.herokuapp.com/), for production
