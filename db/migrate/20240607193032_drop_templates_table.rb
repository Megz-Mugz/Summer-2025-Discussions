class DropTemplatesTable < ActiveRecord::Migration[7.1]
  def up
    drop_table :templates
  end

  def down
    create_table :templates do |t|
      t.string :name
      t.text :description
      t.integer :severity
      t.timestamps
    end
  end

end
