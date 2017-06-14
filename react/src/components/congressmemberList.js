import React, { Component } from 'react';
import Congressmember from './Congressmember';

class CongressmemberList extends Component {
  constructor(props) {
    super(props)
      this.state = {
        congressmembers: [],
        currentPage: 1,
        congressmembersPerPage: 10
      }
    this.getData = this.getData.bind(this);
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(event) {
    this.setState({ currentPage: event.target.id})
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
    let indexOfLastCongressmember = this.state.currentPage * this.state.congressmembersPerPage;
    let indexOfFirstCongressmember = indexOfLastCongressmember - this.state.congressmembersPerPage;
    let currentCongressmembers = this.state.congressmembers.slice(indexOfFirstCongressmember, indexOfLastCongressmember);

    let newCongressmembers = currentCongressmembers.map((congressmember, index) => {
      return (
        <Congressmember
          key={index}
          id={index}
          full_name={congressmember.full_name}
          state={congressmember.state}
          chamber={congressmember.chamber}
        />
      )
    });

    let pageNumbers = [];
    for(let i = 1; i <= Math.ceil(this.state.congressmembers.length / this.state.congressmembersPerPage); i++) {
      pageNumbers.push(i);
    }

    let renderPageNumbers = pageNumbers.map(number => {
      return(
        <li
          key={number}
          id={number}
          onClick={this.handleClick}
        >
          {number}
        </li>
      )
    })

    return (
      <div>
        <div className="expandable">
          <div className="cards-container">
            <div className="table-cards">
              {newCongressmembers}
            </div>
          </div>
        </div>
        <ul>
          {renderPageNumbers}
        </ul>
      </div>
    )
  }
}

export default CongressmemberList;
