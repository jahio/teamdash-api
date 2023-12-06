# TeamDash API: A Team and Individual-Oriented Dashboard

You're on a team at work. You all have a myriad of links all over the place that are easily lost amidst a sea of terrible bookmark managers (or, no bookmark manager more likely) in a managed environment that can't keep up with you. You share a link with somebody in Teams or what-not, and more often than not, you can't find it two months later when somebody new joins your team and they now need it because search functionality still somehow just sucks in an age where we've managed to fly helicopters on Mars and develop artificial intelligence.

So why not just deploy a static dashboard somewhere, right? So you do that, but then you quickly realize that in a large organization, other teams need this same kind of functionality, too.

Thing is, they need most of the same links you do, albeit with a few tweaks. Slightly different categorization and layout. A few different ones relevant to them here, a couple new ones there, ditch these over here - we don't care about those, not our jam - and before you know it, every different team and department in your organization, division, whatever sees that hey, this dashboard thing might be quite useful, especially as your browser's homepage.

But what if we need to tie it into our custom SSO? That isn't really standard SSO because our company | non-profit | government division | whatever decided to snowflake for some reason?

Okay, fine, here's the source code. Have fun, ya'll.

## This is my aspiration with TeamDash: I'll give you 80-95% of what you need. You configure the rest.

## Architecture:

1. Separate API and frontend applications
1. API needs just a Ruby server and a PostgreSQL database plus maybe a Redis instance and a Sidekiq container (likely a Docker Compose file will be provided at the end to smooth this over)
1. Frontend, after static compilation, will be just a matter of: point me at the API and stick me behind nginx, and I'm good to go
1. Configure the authentication any way you want. Admittedly this is something of a "I'm still figuring this one out" item but the idea is to put this behind some form of abstraction so that it's easy to mold and shape to your liking
1. Don't like the look? Fine - roll your own frontend! That's why the API and frontend are separate apps!

## Theoretical (Aspirational) Feature Set:

1. You have users - individual people.
1. The overall admin user creates "teams", namespaces essentially.
1. They can then assign individual users into those teams and designate who is the "admin" for that team
1. Each team admin can then configure that team's dashboard settings - who has which links under which categories, colors/themes, etc.
1. HOWEVER: Each individual user can also add more links to their own dashboard that affect ONLY THEM without polluting everyone else's space
1. Individuals can also choose/override preferences like theme/colors etc. affecting only their own personal preferences
1. SSO is not necessarily required - my MVP will be non-SSO for the sake of just getting a proof of concept out the door

