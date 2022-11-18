class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      # コメント機能
      t.integer :user_id,  null: false, default: ""
      t.integer :post_id,  null: false, default: ""
      t.string :comment,   null: false, default: ""

      t.timestamps
    end
  end
end
