class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :task1
      t.string :task2
      t.string :task3
      t.string :task4
      t.string :task5
      t.string :task6
      t.references :child, foreign_key: true
      t.timestamps
    end
  end
end
