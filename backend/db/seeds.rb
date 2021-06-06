puts "Clearing old data..."
Auction.destroy_all
Bidder.destroy_all
Bid.destroy_all

puts "Seeding Data"

Auction.create(name: "Woody", open: true, description: "it's an egg!", img_url: "http://www.pngmart.com/files/3/Toy-Story-Woody-PNG-Photos.png")
Auction.create(name: "Buzz Lightyear", open: true, description: "it's an egg!", img_url: "http://www.pngmart.com/files/6/Buzz-Lightyear-PNG-Transparent-Picture.png")
Auction.create(name: "Mr. Potato Head", open: true, description: "it's an egg!", img_url: "https://vignette.wikia.nocookie.net/universe-of-smash-bros-lawl/images/d/d8/Mr-potato-head-toy-story.gif/revision/latest?cb=20151129131217")
Auction.create(name: "Slinky Dog", open: true, description: "it's an egg!", img_url: "https://www.freeiconspng.com/uploads/slinky-png-transparent-1.png")
Auction.create(name: "Rex", open: true, description: "it's an egg!", img_url: "http://umich.edu/~chemh215/W11HTML/SSG5/ssg5.2/FRex.png")
Auction.create(name: "Bo Peep", open: true, description: "it's an egg!", img_url: "http://4.bp.blogspot.com/_OZHbJ8c71OM/Sog43CMFX2I/AAAAAAAADEs/0AKX0XslD4g/s400/bo.png")
Auction.create(name: "Hamm", open: true, description: "it's an egg!", img_url: "https://cdn140.picsart.com/244090226021212.png?r1024x1024")
Auction.create(name: "Little Green Men", open: true, description: "it's an egg!", img_url: "http://www.pngmart.com/files/3/Toy-Story-Alien-PNG-File.png")

Bidder.create(name: "Dante")
Bidder.create(name: "Miles") 
Bidder.create(name: "Jasper")
Bidder.create(name: "Lantz")

20.times do

    Bid.create(amount: rand(1...100), bidder_id: Bidder.ids.sample , auction_id: Auction.ids.sample)
end
puts "Done!"