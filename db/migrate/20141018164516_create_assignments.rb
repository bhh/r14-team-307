class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.references :ingredient, index: true
      t.references :recipe, index: true

      t.timestamps
    end
  end
end
