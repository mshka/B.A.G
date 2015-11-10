class AddAttachmentMenuPictureToRestaurants < ActiveRecord::Migration
  def self.up
    change_table :restaurants do |t|
      t.attachment :menu_picture
    end
  end

  def self.down
    remove_attachment :restaurants, :menu_picture
  end
end
