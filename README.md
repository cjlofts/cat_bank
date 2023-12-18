# Catbank

**To run the app locally**
* Assume running on MacOS & brew is installed
* Assume rails 7.1.2, ruby 3.2.2, bundler & postgresql installed

*clone the repo from `git@github.com:cjlofts/cat_bank.git`
*`cd` into the catbank derectory & run `bundle install`
*start postgres with `brew services start postgresql`
*run `rails db:create db:migrate`
*run `rake assets:precompile` (incase having problems with Tailwind fonts in the asset pipeline)
*run `rails s` & visit `http://localhost:3000/` in a browser
