class AddAttachmentItemPictureToRestaurants < ActiveRecord::Migration
  def self.up
    change_table :restaurants do |t|
      t.attachment :item_picture
    end
  end

  def self.down
    remove_attachment :restaurants, :item_picture
  end
end
