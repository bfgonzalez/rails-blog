class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.integer :id
      t.text :title
      t.text :body

      t.timestamps
    end
  end
end
