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
    this.previousPage = this.previousPage.bind(this);
    this.nextPage = this.nextPage.bind(this);
  }

  previousPage(event) {
    let newPage = this.state.currentPage - 1;
    this.setState({ currentPage: newPage })
  }

  nextPage(event) {
    let newPage = this.state.currentPage + 1;
    this.setState({ currentPage: newPage })
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

    let currentCongressmembers;

    if (indexOfFirstCongressmember < 0 ) {
      currentCongressmembers = this.state.congressmembers.slice(0, 10);
    } else if (indexOfLastCongressmember > this.state.congressmembers.length) {
      currentCongressmembers = this.state.congressmembers.slice(this.state.congressmembers.length - 10, this.state.congressmembers.length)
    } else {
      currentCongressmembers = this.state.congressmembers.slice(indexOfFirstCongressmember, indexOfLastCongressmember);
    }

    let newCongressmembers = currentCongressmembers.map((congressmember, index) => {
      return (
        <Congressmember
          key={index}
          id={index + 1}
          full_name={congressmember.full_name}
          state={congressmember.state}
          chamber={congressmember.chamber}
        />
      )
    });

    return (
      <div>
        <div className="expandable">
          <div className="cards-container">
            <div className="table-cards">
              {newCongressmembers}
            </div>
          </div>
        </div>
        <div className="text-center">
          <button className="hollow button numbers" onClick={this.previousPage}>
            Previous Page
          </button>
          <button className="hollow button numbers" onClick={this.nextPage}>
            Next Page
          </button>
        </div>
      </div>
    )
  }
}

export default CongressmemberList;
