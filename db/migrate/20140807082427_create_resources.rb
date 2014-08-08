class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.references :instance, polymorphic: true, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
