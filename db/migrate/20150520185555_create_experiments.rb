class CreateExperiments < ActiveRecord::Migration
  def change
    create_table :experiments do |t|
      t.text :title
      t.text :procedure
      t.text :results
      t.text :conclusion
      t.boolean :active, default: true
      t.belongs_to :staffer, class_name: "User"
      t.belongs_to :proposal

      t.timestamps
    end
  end
end
