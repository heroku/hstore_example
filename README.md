## Hstore Example App

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

We then tell give the Products table a generic `data` column with a type of `hstore`. We are using the migration syntax provided to us by using the `activerecord-postgres-hstore` gem.


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

As you see above, we can store any types of values that we want into the hstore