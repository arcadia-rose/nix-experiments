class CreateHelloworlds < ActiveRecord::Migration[7.0]
  def change
    create_table :helloworlds do |t|

      t.timestamps
    end
  end
end
