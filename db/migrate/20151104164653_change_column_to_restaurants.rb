class ChangeColumnToRestaurants < ActiveRecord::Migration
  def change
    rename_column :restaurants, :twitter_page, :twitter_handle
  end
end
