# highlighter
This rails app saves "highlights", aka selected passages of text, while reading online. The highlights are sent from this browser extension: https://github.com/smcalilly/highlighter-chrome

Visit www.highlighter.online.

I don't work with Rails much so I'm gonna save some useful commands here.

`heroku logs --tail --app=high-lighter`
`kill -9 $(lsof -i :3000 -t)`


tagging: https://laragon.org/rails/tagging.html
polymorphism: https://cobwwweb.com/rails-has-many-through-polymorphic-association

Add a reference to a model
`rails generate migration AddHighlightsRefToTaggings highlight:references`
`rails generate migration AddTaggableToTaggings taggable:references{polymorphic}`

Some of the tests are using minitest and some are yusing rspec...
Running specs
```
# Default: Run all spec files (i.e., those matching spec/**/*_spec.rb)
$ bundle exec rspec

# Run all spec files in a single directory (recursively)
$ bundle exec rspec spec/models

# Run a single spec file
$ bundle exec rspec spec/controllers/accounts_controller_spec.rb

# Run a single example from a spec file (by line number)
$ bundle exec rspec spec/controllers/accounts_controller_spec.rb:8

# See all options for running specs
$ bundle exec rspec --help
```

configured tailwind thanks to this
https://web-crunch.com/posts/how-to-install-tailwind-css-using-ruby-on-rails#
trix
```
<div class="field">
    <%= form.label :content %>
    <%= form.text_field :tag_list, placeholder: 'tags' %>
    <%= form.rich_text_area :content %>
    <%= form.submit 'Create' %>
  </div>
```


## Markdown editor
thanks to this gem https://github.com/vmg/redcarpet
and one that renders it on change in the client (need to test that they work well together)
some code to read again http://vaidehijoshi.github.io/blog/2015/08/11/rolling-out-the-redcarpet-for-rendering-markdown/

# ughs
rm -fr tmp/cache
https://stackoverflow.com/questions/7042440/rails-using-cached-application-css-despite-changes