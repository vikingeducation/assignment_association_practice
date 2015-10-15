class CreatePts < ActiveRecord::Migration
  def change
    create_table :pts, id: false do |t|

      t.references :post
      t.references :tag

    end
  end
end
