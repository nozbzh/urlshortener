# URL shortener

Check out the deployed version [here](http://komodo.us)!

## Description

This app offers reliable URL shortening as well as some random facts and photos of Komodo dragons. This feature is a simple way to make it stand out in the crowded world of URL shorteners. More seriously, I simply chose this theme as I spent almost 2 years on a boat in the Komodo National Park in Indonesia and I kind of miss it!

It's very simple to use. Just paste your link in the form on the home page and submit. You will be redirected to a result page with your shortened link, an image of a Komodo dragon as well as a fact about this giant reptile.

# Demo

![komodo.us demo GIF](http://g.recordit.co/BFBEMvnlrm.gif)

## Technology used

This app is built with Rails 5.0.0.beta3 and Ruby 2.3 on the backend. The databse is Postgresql.
The templating language chosen is SLIM, which I find much more concise than the default ERB.
This appliation uses javacript to auto select the short URL generated in order to make copying and pasting it more convenient.

## Challenges

Generating the short_url token was what I found tricky. Read more about it on [my blog](http://noestauffert.com/blog/the-challenges-i-faced-building-a-simple-url-shortener-using-rails-5).

## Things to improve

I am still not satisfied with my #generate_short_url method. I need to find a way around the possible infinite loop.
