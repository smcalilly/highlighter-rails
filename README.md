# Hi Writer
Hi Writer is an app for your messy brain. It is a writing tool with version control so you can kill your darlings without losing them forever. It is a browser extension to help you read. It organizes your projects like a filing cabinet, but with better sorting and searching. It is your new treasure chest. 

In tech speak, it's a text editor with a file system-like workflow and version control.

Visit www.highlighter.online.

## Models
### Tag
  A tag is a way to classify a piece of content. The Highlight, Note, and Assortment models are all taggable.
### Source
  A source is a primary source, like an HTML page, a book, a video, etc. Currently only supported for any content viewable via a browser. It has many highlights. 
### Highlight
  A highlight is a quote or passage from a text, also known as a Source. In the future, a highlight might be a video clip or photo. A highlight must belong to a source.
### Note
  A note is a piece of writing. It is a flexible entity and can belong to many things, such as a Source, Highlight, or Project. A note can be Markdown or plain text.
### Project
  A project is a writing project. It's a text editor with version control, plus a file system to improve the workflow. It allows a user to add tags to the project, which will automatically include any piece of content with the tag. Since a user can add any Note, Highlight, or Source to a project, and not just stuff with tags, the user is not bound to certain tags for a project, but typically tags are thematic to the project.
### Assortment
  An assortment is a combination of tags. It's a way to combine related or unrelated pieces of content. It's meant to be a well to draw upon when writing or learning or whatever. This might typically be called a "Category," but the current name is Assortment. A project can have many Assortments.


I don't work with Rails much so I'm gonna save some useful commands here.

## heroku commands
`heroku logs --tail --app=high-lighter`
`heroku run rails console`
`heroku run rake db:migrate` (need to move this to a procfile)

## development stuff
`kill -9 $(lsof -i :3000 -t)`


### Add a reference to a model
`rails generate migration AddHighlightsRefToTaggings highlight:references`
`rails generate migration AddTaggableToTaggings taggable:references{polymorphic}`\
`rails generate migration AddUsersRefToAssortments user:references`


## Testing
Some of the tests are using minitest and some are using rspec (Sorry! I don't know what I'm doing + the tagging guide I followed used rspec after I had used minitest for some things...)
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

## Tailwind CSS
The app uses TailwindCSS for styling. [It's well-documented](https://tailwindcss.com/docs/utility-first) and maps intuitively to plain CSS. It's configured in this app thanks to this:
https://web-crunch.com/posts/how-to-install-tailwind-css-using-ruby-on-rails#


## Markdown editor
thanks to this gem https://github.com/vmg/redcarpet
and one that renders it on change in the client (need to test that they work well together)
some code to read again http://vaidehijoshi.github.io/blog/2015/08/11/rolling-out-the-redcarpet-for-rendering-markdown/

## postgres
https://rollout.io/blog/unleash-the-power-of-storing-json-in-postgres/

## etc
tagging: https://laragon.org/rails/tagging.html
polymorphism: https://cobwwweb.com/rails-has-many-through-polymorphic-association

# ughs
rm -fr tmp/cache
https://stackoverflow.com/questions/7042440/rails-using-cached-application-css-despite-changes
https://blog.55minutes.com/2012/02/untangling-the-rails-asset-pipeline-part-1-caches-and-compass/