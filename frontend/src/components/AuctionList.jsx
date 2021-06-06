import React, { Component } from 'react';
import AuctionCard from "./AuctionCard"



class AuctionList extends React.Component {


    render(){
        return (
            <div id = "AuctionList">
                {this.props.auctions.map(auction => 

                <AuctionCard 
                    key = {auction.id}
                    name = {auction.name} 
                    desc = {auction.description} 
                    img = {auction.img_url}
                    auctionID = {auction.id}
                    open = {auction.open}
                    createBid = {this.props.createBid}
                    endAuction = {this.props.endAuction}
                    displayWinner = {this.props.displayWinner}
                />)}
            
            </div>
        )
    }
}

export default AuctionList;