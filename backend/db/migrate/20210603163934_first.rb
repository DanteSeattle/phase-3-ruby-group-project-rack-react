class First < ActiveRecord::Migration[5.2]
  def change

    create_table :auctions do |t|
      t.string :name
      t.string :description
      t.string :img_url
      t.boolean :open
    end

    create_table :bidders do |t|
      t.string :name
    end

    create_table :bids do |t|
      t.integer :auction_id
      t.integer :bidder_id
      t.integer :amount
    end

  end
end
