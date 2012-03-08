class Index < ActiveRecord::Migration
  def up
    execute "CREATE INDEX products_gin_data ON products USING GIN(data)"
  end

  def down
    execute "DROP INDEX products_gin_data"
  end
end
