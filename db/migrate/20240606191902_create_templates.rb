class CreateTemplates < ActiveRecord::Migration[7.1]

  def up
    create_table :templates do |t|
      t.string :name
      t.text :description
      t.integer :severity
      t.timestamps
    end
  end

  def down
    drop_table :templates
  end

end
