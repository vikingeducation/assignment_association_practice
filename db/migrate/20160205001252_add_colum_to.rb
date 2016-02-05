class AddColumTo < ActiveRecord::Migration
  def change
      add_timestamps :user_taggings 
  end
end
