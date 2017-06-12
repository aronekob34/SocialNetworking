class AddJobtitleRefToDevelopers < ActiveRecord::Migration[5.0]
  def change
    add_reference :developers, :developer, foreign_key: true
  end
end
