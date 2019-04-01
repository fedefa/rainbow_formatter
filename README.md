This is my customization over [Matt Sears](https://github.com/mattsears/nyan-cat-formatter) Nyan Cat RSpec Formatter. It simply creates a rainbow trail of test results. It also counts the number of examples as they execute and highlights failed and pending specs.

The rainbow changes colors as it runs. See it in action [here](http://vimeo.com/32424001).

Works with RSpec 3.x

Using  Rainbow
---------------

You can either specify the formatting when using the `rspec` command:

    rspec --format RainbowFormatter

Or add `--format RainbowFormatter` to a `.rspec` file placed in your project's root directory,
so that you won't have to specify the `--format` option everytime you run the command.

### Using with Bundler

To use Rainbow formatter with a project that uses Bundler (Rails or Sinatra f.e.) you need to add Rainbow Cat dependecy to your Gemfile:

```ruby
group :test do
  gem "rainbow-formatter"
end
```

And then run `bundle install`.

Installing it
-------------

```
$ gem install rainbow-formatter
```

If you want to use Rainbow as your default formatter, simply put the options in your .rspec file:

```
--format RainbowFormatter
```

Playing the Rainbow song
-------------------------

You can then enjoy playback in two ways:

**1. Play the song only when desired using a command line option:**

Use the following command to run your specs:

```
$ rspec spec -f RainbowFormatter
```

And enjoy the site of Rainbow running across your terminal to the Rainbow song!

**2. Play the song by default when you run your specs:**

Make sure your .rspec file in your application's root directory contains the following:

```
--color
--format RainbowMusicFormatter
```

Then run `rspec spec` and enjoy Rainbow formatted text output accompanied by Rainbow song by default!

**This currently only works on Mac OS X or on Linux (if you have mpg321 or mpg123 installed).**

Using the Rainbow Wide Formatter
---------------------------------

The classic Rainbow Formatter uses a terminal column per test. One
test, and single step that the cat goes ahead. The **Rainbow Wide
Formatter**, instead, uses the whole terminal width, so the cat will
always end up reaching the end of the terminal.

Simple use it by configuring it as the RSpec formatter:

```
--format RainbowWideFormatter
```

Contributing
----------

Once you've made your great commits:

1. Fork Rainbow
2. Create a topic branch - git checkout -b my_branch
3. Push to your branch - git push origin my_branch
4. Create a Pull Request from your branch
5. That's it!

Author
----------
[Federico Farina](https://github.com/fedefa)
