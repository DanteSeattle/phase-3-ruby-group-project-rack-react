import React, { Component } from 'react';

class AuctionCard extends React.Component {

    render(){
        return (
            <div id = "AuctionCard">

               <h2>{this.props.name}</h2>
               <img src= {this.props.img} alt = "alt text" className="toy-avatar"/>
               {this.props.open ? 
               <form className = "create-bid" onSubmit = {(event) => this.props.createBid(event, this.props.auctionID)}>
                    <h3>Submit a bid!</h3>
                    <input type="text" name="name" placeholder="Enter your name" className="input-text"/>
                    <br/>
                    <input type="text" name="amount" placeholder="Enter your bid" className="input-text"/>
                    <br/>
                    <input type="submit" name="submit" value="Create New Bid" className="submit"/>
                </form> 
                : <h2>Auction Over!</h2>}
                {this.props.open ? 
                <button onClick = {() => this.props.endAuction(this.props.auctionID)}>End Auction</button>
                :null}
            </div>
        )
    }
}

export default AuctionCard;