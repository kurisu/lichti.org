# In production, puma doesn't time out if a request takes too long, but Heroku's router will time out at 30 seconds
# To save on local app resources and have external visibility into timouts,
# let's have Rack time out requests before Heroku does
Rack::Timeout.timeout = 20  # seconds