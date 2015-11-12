class ChangeAttributsToReviews < ActiveRecord::Migration
  def change
    change_column_default :reviews, :viewed_by_place, false
    change_column_default :reviews, :reply_viewd_by_user, false
  end
end
