class CreateMistakeUsers < ActiveRecord::Migration[7.1]
  def up
    create_table :mistake_users do |t|
         t.references :user, foreign_key: true
         t.references :mistake, foreign_key: true
         t.timestamps
    end
 end

  def down
    drop_table :mistake_users
  end

end
