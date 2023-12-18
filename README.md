# Catbank

**To run the app locally**
* Assume running on MacOS & brew is installed
* Assume rails 7.1.2, ruby 3.2.2, bundler & postgresql installed

* clone the repo from `git@github.com:cjlofts/cat_bank.git`
* `cd` into the catbank derectory & run `bundle install`
* start postgres with `brew services start postgresql`
* run `rails db:create db:migrate`
* run `rake assets:precompile` (incase having problems with Tailwind fonts in the asset pipeline)
* run `rails s` & visit `http://localhost:3000/` in a browser

**App Frameworks & Approach**
* Disclaimer that the styling is certainly leaves a lot to be desired & there's plenty of validations/optimisations that would need to be implented!!!
* Used as much out of the box rails functionality as possible, included the Devise gem to get user sign_in behaviour handled
* Stimulus adds a tiny bit of JS, not enough functionality to need a front-end framework
* Postgres used for the DB but any DB could be used with a simple data model
* Currently the overdraft facility of Catbank is very generous! Withdrawls are allowed that takes the User's account into negative equity
* Tailwindcss used for fonts but currently the (very minimal) stying is added with HTML/CSS for simlicity 

**Usage**
* Sign up with an email/password & 100 Silveuros are added to a User's account
* Current implementation has a User having one Account (created on User create)
* User can deposit funds & withdraw funds
* User can see their 15 most recent transactions in the Transaction index page
* User can transfer Silveuros to other Users & other Users can transfer Silveuros to the user
