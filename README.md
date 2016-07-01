# Swiftype Rails Integration Demo Application

This is a simple Rails 4 application that publishes changes to a
[Swiftype](http://swiftype.com/) search engine via the API using the
[swiftype gem](https://github.com/swiftype/swiftype-rb) and displays
results using the [jQuery search plugin](https://github.com/swiftype/swiftype-autocomplete-jquery)
and [jQuery auto-complete plugin](https://github.com/swiftype/swiftype-search-jquery).

We have also written a [full tutorial using this application as an example](https://swiftype.com/documentation/tutorials/rails).

## Running the demo

1. Sign up for a [Swiftype account](http://swiftype.com/), then create an API based engine with a Document Type called "post".
2. Clone this repository and run `bundle install`, `rake db:create`, and `rake db:migrate`.
3. Create a `.env` file with your Swiftype API key, engine key, engine slug, and default host (see `.env.example`).
4. Install the `foreman` gem using `gem install foreman`.
5. Run the demo with `foreman start`.

## Running on Heroku

This demo uses SQLite but with some minor modifications you can get it running on Heroku.

1. Remove the `sqlite3` gem and replace it with the `pg` gem.
2. Add the Swiftype Add-on to your app: `heroku addons:add swiftype`
3. Add the configuration variables `SWIFTYPE_ENGINE_KEY`, `SWIFTYPE_ENGINE_SLUG`, and `DEFAULT_HOST` to your Heroku app with `heroku config:add`.
4. Create the document type with `heroku run rake app:create_document_type`
5. Deploy your application.

The demo uses `delayed_job` for API calls, so you will need to add a worker with `heroku ps:scale worker=1`.
If you would like to skip this, you can set `Delayed::Worker.delay_jobs = false` in `application.rb`

## Moving to production

You should create a separate engine for each environment so that
queries do not match documents that don't exist in an application. You
can use the same API key but different engine slugs for this purpose.
