import React, { Component } from 'react';

class Congressmember extends Component {
  constructor(props) {
    super(props)
  }

  render() {
    let chamber = this.props.chamber.toUpperCase()
    return (
      <div className="table-card">
        <a href={`/congressmembers/${this.props.id}`}>
          <img src={'https://rothfus.house.gov/sites/rothfus.house.gov/files/wysiwyg_uploaded/services.jpg'}/>
          <h3>{this.props.full_name}</h3>
          <h5>{this.props.state}</h5>
          <p>{chamber}</p>
        </a>
      </div>
    )
  }
}

export default Congressmember;
