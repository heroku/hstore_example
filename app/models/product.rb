class Product < ActiveRecord::Base
  belongs_to :user

  def as_json(options = {})
    {:name => name, :data => data}
  end
end
