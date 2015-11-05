class AddAttributsToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :name, :string
    add_column :restaurants, :address, :string
    add_column :restaurants, :phone_number, :string
    add_column :restaurants, :website_url, :string
    add_column :restaurants, :facebook_page, :string
    add_column :restaurants, :twitter_page, :string
    add_column :restaurants, :opening_days_hours, :text
    add_column :restaurants, :description, :text
  end
end

    # <%= f.time_select :twitter_page, ampm: true, discard_minute: true %>
