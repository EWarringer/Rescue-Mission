class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |table|
      table.string :body, null: false

      table.timestamps
    end
  end
end
