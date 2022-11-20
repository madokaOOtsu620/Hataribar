class RenameAnswerEnploymentTypeToAnswerEnploymentStatusInPosts < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :answer_employment_type, :answer_employment_status
  end
end
