class AddFlagToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :is_flagged, :boolean
  end
end
