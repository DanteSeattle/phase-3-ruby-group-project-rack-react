require 'pry'
require 'json'

class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/auctions/) && req.get?
      auctions = Auction.all
      return [200, { 'Content-Type' => 'application/json' }, 
      [ {auctions: auctions}.to_json ]]

    elsif req.path.match(/bids/) && req.get?
      bids = Bid.all
      return [200, { 'Content-Type' => 'application/json' }, 
      [ {bids: bids}.to_json ]]

    elsif req.path.match(/bidders/) && req.get?
      bidders = Bidder.all
      return [200, { 'Content-Type' => 'application/json' }, 
      [ {bidders: bidders}.to_json ]]

    elsif req.path.match(/auctions/) && req.patch?
      id = req.path.split("/auctions/").last
      auction = Auction.find(id)
      data = JSON.parse req.body.read
      auction.update(data)

    elsif req.path.match(/bids/) && req.post?
      data = JSON.parse req.body.read
      Bid.create(data)
      return [200, { 'Content-Type' => 'application/json' }, 
      [ {bid: bid}.to_json ]]
    end

    resp.finish
  end

end
