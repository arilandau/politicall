import React, { Component } from 'react';
import Congressmember from './Congressmember';

class CongressmemberList extends Component {
  constructor(props) {
    super(props)
      this.state = {
        congressmembers: []
      }
  }

  getData() {
    fetch('http://localhost:3000/api/v1/congressmembers.json')
      .then(response => {
        if (response.ok) {
          return response;
        } else {
          let errorMessage = `${response.status} ($response.statusText)`,
            error = new Error(errorMessage);
          throw(error);
        }
      })
      .then(response => response.json())
      .then(body => {
        this.setState({ congressmembers: body })
      })
      .catch(error => console.error(`Error in fetch ${error.message}`));
  }

  componentDidMount() {
    this.getData()
  }

  render() {
    let congressmembers = this.state.congressmembers.map((congressmember, index) => {
      return (
        <Congressmember
          key={index}
          full_name={congressmember.full_name}
          state={congressmember.state}
          chamber={congressmember.chamber}
        />
      )
    });

    return (
      <div className="expandable">
        <div className="cards-container">
          <div className="table-cards">
            {congressmembers}
          </div>
        </div>
      </div>
    )
  }
}

export default CongressmemberList;
