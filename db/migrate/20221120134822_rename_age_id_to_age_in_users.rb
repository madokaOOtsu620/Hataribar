class RenameAgeIdToAgeInUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :age_id, :age
  end
end
