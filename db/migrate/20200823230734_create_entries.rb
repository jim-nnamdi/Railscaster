class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|

      t.column :title, :string, :limit = 32,  :null=false
      t.column :description , :text, :null=false 
      t.column :author
      t.column :created_at, :timestamp
      t.timestamps
    end
  end
end
