class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

    # user_idとindustry_idにNOT NULL付け忘れた...
      t.integer :user_id
      t.integer :industry_id
      t.string :answer_what
      t.string :answer_employment_type
      t.string :answer_working_style
      t.string :answer_income
      t.string :answer_how
      t.string :answer_skill
      t.string :answer_why
      t.string :answer_aptitude
      t.string :answer_future
      t.string :answer_advantage
      t.string :answer_free

      t.timestamps
    end
  end
end
