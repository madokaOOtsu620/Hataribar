class CreateIndustries < ActiveRecord::Migration[6.1]
  def change
    create_table :industries do |t|
      # タグみたいな扱い
      t.string :industry

      t.timestamps
    end
  end
end
