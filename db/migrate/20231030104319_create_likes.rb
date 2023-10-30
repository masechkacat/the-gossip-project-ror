class CreateLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :likes do |t|
      t.belongs_to :user, index: true
      t.references :likeable, polymorphic: true
      t.timestamps
    end
  end
end
