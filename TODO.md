### fix
- FIX TAG POLICY BUG!
- delete tag and remove any references 
- dependent: destroy on new models?
- https://github.com/rails/webpacker/issues/2288
- time display is wrong time zone
- purgecss to remove unused tailwind
- html input active when visting page
- back to notes when i'm on home and look at a note. it takes me bacck to notes and not back home, where i was. weird and bad ux.
- validation on tags
- pagination for models indexing
- not sure i follow this? models/user.rb `has_many :tags, :through => :notes`
- more semantic html...specifically ul/li for nav and maybe ul/li for content items
- home#index source link color is different than the others
- does devise "remember me" work?
- pagination
- fix the highlight/source relationship to tags. which one does the tag belong to?
- how efficient is the database, especially the tags? so many loads when home page is requested
- refactor json api into it's own controllers
- project is bringing duplicates for items with the same tags

### UX/UI
- marketing to about...can't access it when logged in bc of the way my authentication is setup
- 404 page
- setup mailer
- restyle error flashes
- responsive!!
- report a bug or contact
- improve home...link to see more notes. pagination
- adding new tags is bad UX...need something like hashtags
- seed database for new users and give basic ux direction
- sources -- add tags to form
- sources preview too short. how to make that better? title field?

### features
- add all the crud actions to the tags?
- project
- note syncing with my google notes
- sorting and filtering for all the models index pages

### notes
- paging
- search

### editor
- ajax on submit, "not saved", "last saved" ... click "save changes" with no user feedback
- version control
- delete note
- md cheat sheet popup

## home
- search by tag
- create an assortment based on that tag

## Editor and project
- Download the document as md, html, plain text, pdf

## projects
- project has many folders, has many tags
- document (has many notes...can be a new note or add copies of actual notes. one note must be the final draft)
- sources
- assortments (has many tags) trash, where?, make your own subfolders. Delete one? (This will permanently delete an assortment, but not the pieces it contains of your brain. But not your assortment’s items. Assortments has many items through itemings
- tags (can go through and assign the tags to different folders within the project)

project
|
|__draft
|  |_note
|  |_note
|
|__pieces?
|  |_where?
|  |_trash?
|
|__notes
|
|__sources
|  |_highlight
|
|__tags

## Version control 
always save each version but make a bigger, more monumental “commit” so that it’s easier to find. No, instead of that, all the pre-notes live in assortments and they have their own version control. All the notes within document have their own version control and ability to branch. A document is the project’s canvas so all the saves (or commits) will stick out more. A basic note can't branch but a document's note can.

i'm leaning towards this gem for version control: https://github.com/palkan/logidze

other options:
https://github.com/paper-trail-gem/paper_trail
https://cobwwweb.com/how-to-use-paper-trail-as-an-activity-feed
https://github.com/chaps-io/public_activity
https://github.com/collectiveidea/audited


### deployment
- need script to do rake task
- setup staging deployment!

### tests
- write tests for notes
- tests for highlights? yes! write tests to simulate extensions or you're gonna keep fucking up the api...maybe wait to refactor api
- tests for sources
- multi tenancy!
- fuck a test


tests
-- controllers
    highlights: source_id in the fixtures?
    api tests for highlights
    sources
    user / devise
-- helpers
    jwt!
-- models
-- system? after i update the ui?

-- how to update a highlight...basically extend it? does that matter, because when the user goes back to the highlight, it will essentially go end to end if the text is unbroken?

more comprehensive here: https://3.basecamp.com/4430364/buckets/15509309/todolists/2371228243



color: #9667a8;
#8dc79f

https://app.sendgrid.com/settings/sender_auth/verify?domain=8651919&provider=


<h1 class='text-center text-xl'>
      <% if @note.title %>
        <%= @note.title %>
      <% else %>
        <%= truncate(@note.body) %>
      <% end %>
    </h1>

<div class="flex flex-row">
    <p class='w-4/5'>
      <strong class='brand'>
      Highlighter</strong> saves your notable quotes, or "highlights," 
      while reading in your favorite web browser.
      Your highlights are always available online to reference whenever you need them.
    </p>
    <div class="flex flex-row">
      <p class='flex w-1/3 justify-center'>
        <%= link_to 'save', '', class: 'text-xs text-purple-300' %>
        <%= link_to 'with', '', class: 'text-xs text-purple-300' %>
        <%= link_to 'tags', '', class: 'text-xs text-purple-300' %>
      </p>
    </div>
  </div>


<%= form.select :tags, @tags.all.collect {|t| [t.name, t.id]} %>