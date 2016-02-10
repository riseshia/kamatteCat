class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :name
      t.string :full_name
      t.string :html_url
      t.integer :github_id
      t.integer :is_target, default: 0
      t.references :user

      t.timestamps null: false
    end
  end
end
