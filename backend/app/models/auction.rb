class Auction < ActiveRecord::Base

    has_many :bids
    has_many :bidders, through: :bids

    def get_winner
        self.bids.max{|a,b| a.amount <=> b.amount}.bidder.name
    end
end