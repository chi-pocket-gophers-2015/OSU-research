class CreateExperiments < ActiveRecord::Migration
  def change
    create_table :experiments do |t|
      t.string :title
      t.string :procedure
      t.string :results
      t.string :conclusion
      t.boolean :active, default: true
      t.belongs_to :staffer, class_name: "User"
      t.belongs_to :proposal

      t.timestamps
    end
  end
end
