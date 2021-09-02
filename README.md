# Ez::Sessions
A simple `ActiveRecord` model for storing user sessions in the database and encode/decode tokens. Works perfectly for API-based apps.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'ez-sessions'
```

Use built-in generators:
```sh
rails generate ez:sessions:install
rails generate ez:sessions:migrations
```

## Usage

Extend your module with api
```ruby
module Auth
  extend Ez::Sessions::API
end
```

Examples:

```ruby
session = Auth.create_session(user_id: 1, user_agent: 'Postman', expires_at: 90.days.from_now)
session.user_id # => 1
session.user_agent # => 'Postman'
session.expires_at.to_s # => '2021-10-02 14:18:21 UTC'
session.token # => Enctyped session token. Can be used for auth http headers like Authrorization Bearer

decoded_session = Auth.decode_session(session.token)
session == decoded_session.id # => true
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
