# WMRUG TDD Session Example App - Chirpscore

This repository contains the starting point of an example app used for our TDD
Sessions.

The original Chirpscore application was built by [Nick Goodall](http://twitter.com/nbgoodall) who
generously has allowed us to use the application idea as the basis for the sessions.

## Installation

Simply clone the repository

    git clone git@github.com:wmrug/tdd-chirpscore

Change into the directory and

    bundle install --binstubs

Copy _dotenv.example_ to _.dotenv_

    cp .env-example .env

Change the credentials appropriately

You also should create a _.test.env_ file which contains the DATABASE_URL for a
test database

You should then be able to start the web app with foreman

`bin/foreman start`

This will start up _thin_ on port 5000 [http://localhost:5000](http://localhost:5000)

### Running specs and features

You can run [Cucumber][1] with:

`bin/cucumber`

And [RSpec][2] with:

`bin/rspec`

Finally, you can run [Guard][3] with:

`bin/guard`

[Capybara][4] is already hooked up for both Cucumber and RSpec

[1]: http://cukes.info                    "Cucumber"
[2]: https://relishapp.com/rspec/         "RSpec"
[3]: https://github.com/guard/guard       "Guard"
[4]: https://github.com/jnicklas/capybara "Capybara"

## User Stories

We'll be implementing the following user stories

*I want to know what my Chirpscore is*

*I want to see a list of the top ten happiest users*

*I want to see a list of the top ten unhappiest users*

*I want more information about the mood of another user*

*I want to compare the Chirpscores of two users*


