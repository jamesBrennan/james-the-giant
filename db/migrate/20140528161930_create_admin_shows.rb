class CreateAdminShows < ActiveRecord::Migration
  def change
    create_table :admin_shows do |t|
      t.date :date
      t.string :city
      t.string :state
      t.string :link

      t.timestamps
    end
  end
end
