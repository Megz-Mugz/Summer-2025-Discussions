class CreateTemplateTable < ActiveRecord::Migration[7.1]

  def up
    create_table :template_table do |t|
      t.string :name
      t.text :description
      t.integer :severity
      t.timestamps
    end
  end


  def down
    drop_table :template_table
  end

end
