class AddAttachmentCoverPictureToRestaurants < ActiveRecord::Migration
  def self.up
    change_table :restaurants do |t|
      t.attachment :cover_picture
    end
  end

  def self.down
    remove_attachment :restaurants, :cover_picture
  end
end
