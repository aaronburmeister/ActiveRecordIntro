class CreateStudentsTable < ActiveRecord::Migration[6.0]
  def change
    create_table(:students) {|t|
      t.string :name
      t.integer :age
      t.boolean :current_student
    }
  end
end
