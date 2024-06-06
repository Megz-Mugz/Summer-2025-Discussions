class AddServerityToMistakes < ActiveRecord::Migration[7.1]
  def up
    add_column :mistakes, :severity, :integer
 end

  def down
    remove_column :mistakes, :severity
  end
end
