import './App.css';
import React from 'react'
import AuctionList from './components/AuctionList';

const RACK_URL = "http://localhost:9292"

class App extends React.Component {

  state = {
    auctions: [],
    bids: [],
    bidders: []
  }


  componentDidMount(){
    fetch(RACK_URL + "/auctions/")
      .then(res => res.json())
      .then(auctionData => {
        this.setState({
          auctions: auctionData.auctions
        })
      })
    
    fetch(RACK_URL + "/bids/")
      .then(res => res.json())
      .then(bidData => {
        this.setState({
          bids: bidData.bids
        })
      })
    fetch(RACK_URL + "/bidders/")
      .then(res => res.json())
      .then(biddersData => {
        this.setState({
          bidders: biddersData.bidders
        })
      })  
    }

    createBid = (event, id) => {
      event.preventDefault();
      let bidder = this.state.bidders.find((bidder) => bidder.name === event.target.name.value)
      let createBid = {
        amount: event.target.amount.value,
        auction_id: id,
        bidder_id: bidder.id
      }
      let reqPackage = {
        headers: {"Content-Type":"application/json"},
        method: "POST",
        body: JSON.stringify(createBid)
      }

      fetch(RACK_URL + "/bids/", reqPackage)
      .then(res => res.json())
      .then(data => {
        this.setState({
          bids: [...this.state.bids, data.bid]
        })
      })
    }

    endAuction = (auctionId) => {
      let updateAuction = {open: false}
      let reqPackage = {
        header: {"Content-Type":"application/json"},
        method: "PATCH",
        body: JSON.stringify(updateAuction)
      }

      fetch(`${RACK_URL}/auctions/${auctionId}`, reqPackage)
      .then(res=>res.json())
      .then(updateAuctions => {
        this.setState({
          auctions: [...this.state.auctions.map(auction => auction.id === updateAuctions.id ? updateAuction : auction)]
        })
      })
    }

    displayWinner = (auctionId) => {
      let bids = this.state.bids.filter(auction => auction.auction_id === auctionId)
      return (bids)
    }

  render(){
    return(
      <div>
        <AuctionList auctions = {this.state.auctions} 
        createBid = {this.createBid}
        endAuction = {this.endAuction}
        displayWinner = {this.displayWinner}/>
      </div>
    )
   }
}

export default App;
