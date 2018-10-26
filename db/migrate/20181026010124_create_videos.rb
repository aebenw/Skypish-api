class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :kind
      t.integer :from
      t.integer :to
      t.string :sdp
      t.string :candidate
      t.references :conversation, foreign_key: true
      t.references :user, foreign_key: :true
      t.timestamps
    end
  end
end
