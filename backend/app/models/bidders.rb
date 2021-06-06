class Bidder < ActiveRecord::Base

    has_many :bids
    has_many :auctions, through: :bids
  
end