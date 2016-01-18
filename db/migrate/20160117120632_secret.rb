class Secret < ActiveRecord::Migration
  def change
    create_table :secret do |t|
        t.string :title
        t.text :content
    end
  end
end
