class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string  :name
      t.hstore  :data
      t.timestamps
    end
  end
end
