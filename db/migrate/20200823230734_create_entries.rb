class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|

      t.column :title, :string, :limit => 32,  :null=>false
      t.column :description , :text
      t.column :author, :string
      t.timestamps
    end
  end
end
