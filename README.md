## Virtual Watch Party

[![Contributors][contributors-shield]][contributors-url]
[![Issues][issues-shield]][issues-url]
[![Stargazers][stars-shield]][stars-url]
[![Forks][forks-shield]][forks-url]
# Welcome to Virtual Watch Party
## The application that brings people together
## But keeps them apart
<p align="center">
  <img src="https://user-images.githubusercontent.com/74567704/131438329-1ea0d25f-41b3-4226-98b1-56efb570a5ec.png" alt="top_rated_movies_page"/>
</p>

Find the [project spec here](https://backend.turing.edu/module3/projects/viewing_party/index).
## Table of Contents

- [Overview](#overview)
- [Tools Utilized](#tools-used)
- [Contributing](#contributors)

# README
------

### <ins>Overview</ins>

[Virtual Watch Party](https://github.com/bfl3tch/viewing_party) is a 10-day, 2 person project, during Mod 3 of 4 for Turing School's Back End Engineering Program.

Overview: We created an application that consumes a movie database 3rd party API and allows users to login and add their friends to `Virtual-Watch-Parties` which are "dates" to all watch the chosen movie at an agreed upon time.

- Consume JSON APIs that require authentication ⭐ ⭐ ⭐
- Build an application that requires basic authentication ⭐ ⭐ ⭐
- Organize and refactor code to be more maintainable ⭐ ⭐
- Implement a self-referential relationship in ActiveRecord ⭐ ⭐
- Apply RuboCop’s style guide for code quality ⭐
- Utilize Continuous Integration using Travis CI ⭐
- Deploy to Heroku ⭐
- Apply principles of flow control across multiple methods
- Design a self referential relationship using a schema designer
- Write migrations to create tables with columns of varying data types and foreign keys.
- Use Rails to create web pages that allow users to CRUD resources
- Create instance and class methods on a Rails model that use ActiveRecord methods and helpers
- Write model and feature tests that fully cover data logic and potential user behavior

[Technical Requirements](https://backend.turing.edu/module3/projects/viewing_party/requirements)

### <ins>Tools Used</ins>
- Ruby 2.7.2
- Rails 5.2.6
- PostgresQL
- BCrypt
- Postico
- Faraday
- Figaro
- Webmock
- VCR
- Capybara
- Travis CI
- Launchy
- RuboCop
- Orderly
- SimpleCov
- FactoryBot
- Git/GitHub
- HTML
- CSS
- Bootstrap
- RSpec
- Pry
- Atom

### <ins>Contributors</ins>

👤  **Brian Fletcher**
- Github: [Brian Fletcher](https://github.com/bfl3tch)
- LinkedIn: [Brian Fletcher](https://www.linkedin.com/in/bfl3tch)

👤  **Elliot Olbright**
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


# Virtual Watch Party


## Requirement Overview
### Use RuboCop in project to enforce style guide
### Deploy to Heroku
### Use TravisCI for Continuous Integration
### Consume The Movie DB API
### Implement Basic Auth
### ActionMailer

#### Use co-authored commits when doing driver/navigator pairing.

##### A note about friendships
###### The user story about adding friends states that if User A and User B are in the database and User A adds User B as a friend, then that friendship is confirmed, and User A can now invite User B to a Viewing Party. It does not explicitly state that User B must also add User A as a friend. Think of this like a Twitter “follow” relationship: if I follow you, I can invite you to a Viewing Party, but you can’t invite me to a party unless you follow me first.

## Setup

This project requires Ruby 2.7.2.

* Fork this repository
* Clone your fork
* From the command line, install gems and set up your DB:
    * `bundle`
    * `rails db:create`
* Run the test suite with `bundle exec rspec`.
* Run your development server with `rails s` to see the app in action.

## Phases

1. [Database Setup](./doc/db_setup.md)
1. [User Stories](./doc/user_stories.md)
1. [Extensions](./doc/extensions.md)
1. [Evaluation](./doc/evaluation.md)



#### Project Configurations

* Ruby version
    ```bash
    $ ruby -v
    ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-darwin20]
    ```

* [System dependencies](https://github.com/bfl3tch/little-esty-shop/blob/main/Gemfile)
    ```bash
    $ rails -v
    Rails 5.2.6
    ```

* Database creation
    ```bash
    $ rails db:{drop,create,migrate,seed}
    Created database 'little_esty_shop_development'
    Created database 'little_esty_shop_test'
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


# Viewing Party

This is the base repo for the [viewing party project](https://backend.turing.io/module3/projects/viewing_party) used for Turing's Backend Module 3.

### About this Project

Viewing party is an application in which users can explore movie options and create a viewing party event for the user and friend's.

## Local Setup

1. Fork and Clone the repo
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:create`


## Versions

- Ruby 2.7.2

- Rails 5.2.5

Example wireframes to follow are found [here](https://backend.turing.io/module3/projects/viewing_party/wireframes)
