class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :limit => 32

      t.timestamps null: false
    end
  end
end
