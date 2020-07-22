# highlighter
This rails app saves "highlights", aka selected passages of text, while reading online. The highlights are sent from this browser extension: https://github.com/smcalilly/highlighter-chrome

Visit www.highlighter.online.

I don't work with Rails much so I'm gonna save some useful commands here.

`heroku logs --tail --app=high-lighter`
`kill -9 $(lsof -i :3000 -t)`


tagging: https://laragon.org/rails/tagging.html

Add a reference to a model
`rails generate migration AddHighlightsRefToTaggings highlight:references`