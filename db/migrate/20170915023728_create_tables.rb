class CreateTables < ActiveRecord::Migration[5.1]
  def change

    create_table :users do |t|
      t.string :username
      t.decimal :balance, precision: 8, scale: 2, default: 0
    end

    create_table :red_packets do |t|
      t.references :user
      t.decimal :amount, precision: 8, scale: 2
      t.integer :size
      t.decimal :remain_amount, precision: 8, scale: 2
      t.integer :remain_size
      t.string :password
      t.timestamps
    end
    add_index :red_packets, :created_at

    create_table :red_packet_fragments do |t|
      t.references :user
      t.references :red_packet
      t.decimal :amount, precision: 8, scale: 2
    end

  end
end
