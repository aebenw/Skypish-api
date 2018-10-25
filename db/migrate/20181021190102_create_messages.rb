class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :text
      t.string :kind
      t.string :from
      t.string :to
      t.string :sdp
      t.string :candidate
      t.references :conversation, foreign_key: true
      t.references :user, foreign_key: :true

      t.timestamps
    end
  end
end
