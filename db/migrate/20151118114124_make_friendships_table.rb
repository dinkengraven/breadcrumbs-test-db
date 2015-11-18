class MakeFriendshipsTable < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.belongs_to :user, index: true
      t.belongs_to :friend, index: true
      t.string :status
      t.datetime :accepted_at

      t.timestamps null: false
    end
  end
end
