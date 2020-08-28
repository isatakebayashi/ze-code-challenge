class CreatePartners < ActiveRecord::Migration[6.0]
  def change
    create_table :partners, id: false do |t|
      t.string :id, primary_key: true
      t.string :trading_name, null: false
      t.string :owner_name, null: false
      t.string :document, null: false
      t.multi_polygon :coverage_area, null: false
      t.st_point :address, geographic: true, null: false
    end
  end
end
