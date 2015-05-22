class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.text :title
      t.text :hypothesis
      t.boolean :active, default: true
      t.text :summary
      t.belongs_to :faculty, class_name: "User"
      t.belongs_to :category

      t.timestamps
    end
  end
end
