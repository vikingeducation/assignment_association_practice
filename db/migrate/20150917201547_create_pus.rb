class CreatePus < ActiveRecord::Migration
  def change
    create_table :pus, id: false do |t|

      t.references :post
      t.references :user

    end
  end
end
