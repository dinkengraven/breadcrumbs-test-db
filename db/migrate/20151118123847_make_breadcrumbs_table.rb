class MakeBreadcrumbsTable < ActiveRecord::Migration
  def change
    create_table :breadcrumbs do |t|
      t.integer :creator_id
      t.integer :receiver_id
      t.string :geolocation
      t.text :body
      t.string :path_to_photo
      t.boolean :found

      t.timestamps null: false
    end
  end
end
