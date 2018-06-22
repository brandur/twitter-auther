# twitter-auther

A really simple script that makes it easy (or rather easier) to get an API key
for Twitter.

You'll first need to visit [Twitter Apps][apps], create an application, and get
its consumer key and secret. These will be passed to the script as
`CONSUMER_KEY` and `CONSUMER_SECRET`.

We use [direnv], but you can use whatever method for passing environmental
variables that you'd like.

``` sh
cp .envrc .envrc.sample
# edit values in .envrc
direnv allow

bundle install
bundle exec ruby main.rb
```

[apps]: https://apps.twitter.com/
[direnv]: https://direnv.net/

<!--
# vim: set tw=79:
-->
