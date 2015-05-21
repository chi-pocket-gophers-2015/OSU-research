class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.string :title
      t.string :hypothesis
      t.boolean :active
      t.string :summary
      t.belongs_to :faculty, class_name: "User"
      t.belongs_to :category

      t.timestamps
    end
  end
end
