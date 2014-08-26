
# Define Subscriptions
Subscription.create(id: 1, name: 'Administrator')
Subscription.create(id: 2, name: 'Basic')
Subscription.create(id: 3, name: 'Standard')
Subscription.create(id: 4, name: 'Premium')
Subscription.create(id: 5, name: 'Enterprise')

# Setup first user
User.create(id: 1, email: 'andy.macnaughton@gmail.com', subscription_id: 1, password_digest: 'x', forename: 'Andrew', surname: 'Macnaughton')
