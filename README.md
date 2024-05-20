# Bugsnag::Error::Event::Downloader

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/bugsnag/error/event/downloader`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add bugsnag_error_event_downloader

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install bugsnag_error_event_downloader

## Usage

TODO: Write usage instructions here

## Usage on docker integration

First, you can setup doker compose.

```shell
docker compose build
```

Configure the environment variables.

```shell
cp .env.skeleton .env
# Edit auth token
vi .env
```

After setup, you can run it.

```shell
docker compose up -d
docker compose exec ruby bash
bugsnag_error_event_downloader
# or
docker compose run --rm ruby bash
bugsnag_error_event_downloader
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/bugsnag_error_event_downloader.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
