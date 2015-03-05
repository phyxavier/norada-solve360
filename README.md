# Norada::Solve360

gem 'norada_solve360', '~> 1.0.5'

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'norada_solve360'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install norada_solve360

## Usage

Connect to Norada

		norada_api = NoradaSOLVE360::API.new('api_key', 'username')

Finders

		members = norada_api.find_contacts(:all, {:layout => 1, :limit => "#{count}", :filtermode => 'category', :filtervalue => norada_category_id })

		norada_api.find_contacts_categories(:all)

		norada_api.find_contacts(norada_contact_id)

Create & Update

		tag_vars = {categories: {add: ['tag-a', 'tag-b']}}

		norada_api.update_contacts(norada_contact_id, tag_vars)

		norada_api.create_contacts_categories({:name => 'name'})

## Contributing

1. Fork it ( https://github.com/[my-github-username]/norada-solve360/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
