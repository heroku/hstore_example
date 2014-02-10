class Product < ActiveRecord::Base
  belongs_to :user
  serialize :data, ActiveRecord::Coders::Hstore

  def as_json(options = {})
    {:name => name, :data => data}
  end
end
