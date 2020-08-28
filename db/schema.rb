# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_23_125017) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "partners", id: :string, force: :cascade do |t|
    t.string "trading_name", null: false
    t.string "owner_name", null: false
    t.string "document", null: false
    t.geometry "coverage_area", limit: {:srid=>0, :type=>"multi_polygon"}, null: false
    t.geography "address", limit: {:srid=>4326, :type=>"st_point", :geographic=>true}, null: false
  end

end
