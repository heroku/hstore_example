## Hstore Example App for Heroku

To view a working demo go to [Heroku's Hstore Demo](http://hstoredemo.herokuapp.com/) online or check out the [Screencast](http://schneems.com/post/18936504013).

Ensure you've got a recent version of Postgres (9.1 and up) by running `psql --version`. Upgrade if necessary. Clone this repo to your had drive. Move into that directory and run:

```shell
  gem install bundler
  bundle install
```

Then create a database and run your migrations

```shell
  bundle exec rake db:create
  bundle exec rake db:migrate
````

This migration will create Users, Products, and enable hstore in this database by executing this command in Postgres:

```
  CREATE EXTENSION hstore;
```

While the hstore column type is supported natively by Rails 4, it isn't in Rails 3 yet. Until Rails 4 is released we can use the `activerecord-postgres-hstore` gem. In your migration  give the Products table a generic `data` column with a type of `hstore`.


```ruby
  create_table :products do |t|
    t.string :name
    t.hstore :data
    t.timestamps
  end
````

Now We can open up a console and store any type of hash data to the data column of products like this:

```ruby
    Product.create(:name => "Geek Love: A Novel", :data => {'author' => 'Katherine Dunn', 'pages' => 368, 'category' => 'fiction'})
    Product.last.data['category']  # => 'fiction'
```

As you see above, we can store any types of values that we want into the hstore. We can query the keys and values in any number of ways.


```ruby

      # Find all products that have a key of 'author' in data
      Product.where("data ? :key", :key => 'author')

      # Find all products that have a 'pages' and '368' key value pair in data
      Product.where("data @> (:key => :value)", :key => 'pages', :value => '368')

      # Find all products that don't have a key value pair 'pages' and '999' in data
      Product.where("not data @> (:key => :value)", :key => 'pages', :value => '999')

      # Find all products having key 'author' and value like 'ba' in data
      Product.where("data -> :key LIKE :value",     :key => 'author, :value => "%Kat%")
```

## Contact

Richard Schneeman [@Schneems](http://twitter.com/schneems) for [Heroku](http://heroku.com).


licensed under MIT License
Copyright (c) 2011 Schneems. See LICENSE.txt for
further details.