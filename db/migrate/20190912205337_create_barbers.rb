class CreateBarbers < ActiveRecord::Migration[6.0]
  def change
    create_table :barbers do |t|
      t.text :name

      t.timestamps
    end

    ['Jessie Pinkman', 'Walter White', 'Gus Fring'].each do |barber|
      Barber.create(name: barber)
    end
  end
end
