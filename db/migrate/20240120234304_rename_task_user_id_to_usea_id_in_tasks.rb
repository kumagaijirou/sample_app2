class RenameTaskUserIdToUseaIdInTasks < ActiveRecord::Migration[7.0]
  class CreateTasks < ActiveRecord::Migration[7.0]
    def change
      create_table :tasks do |t|
        t.text :content
        t.integer :user_ID
        t.integer :bet_user_ID
        t.datetime :deadline_at
        t.integer :amount_bet
        t.boolean :success_failure
  
        t.timestamps
      end
      add_index :Tasks, [:user_id, :created_at]
    end
  end
end