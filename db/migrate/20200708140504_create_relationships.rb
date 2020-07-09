class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :following_id

      t.timestamps null: false
    end

    add_index :relationships, :follower_id
    add_index :relationships, :following_id
    #一意性制約（重複データ禁止）
    add_index :relationships, [:follower_id, :following_id], unique: true
  end
end
