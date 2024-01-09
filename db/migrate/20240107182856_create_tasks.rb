class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.text :task_content
      t.integer :task_user_ID
      t.integer :task_bet_user_ID
      t.datetime :task_deadline_at
      t.integer :Amount_bet
      t.boolean :Task_success_failure

      t.timestamps
    end
    add_index :Tasks, [:task_user_id, :created_at]
  end
end
