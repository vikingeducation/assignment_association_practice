class CreateAuthorships < ActiveRecord::Migration
  def change
    create_table :authorships do |t|
    

      t.timestamps null: false
    end
  end
end
