import React, { Component } from 'react';
import Congressmember from './Congressmember';

class CongressmemberList extends Component {
  constructor(props) {
    super(props)
      this.state = {
        congressmembers: [],
        currentPage: 1,
        congressmembersPerPage: 10,
        search: ''
      }
    this.getData = this.getData.bind(this);
    this.previousPage = this.previousPage.bind(this);
    this.nextPage = this.nextPage.bind(this);
    this.updateSearch = this.updateSearch.bind(this);
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

  updateSearch(event) {
    this.setState({ search: event.target.value.substr(0,20) });
  }

  render() {
    let filteredCongressmembers = this.state.congressmembers.filter(
      (congressmember) => {
        return congressmember.full_name.toLowerCase().indexOf(this.state.search.toLowerCase()) !== -1 ||
          congressmember.state.toLowerCase().indexOf(this.state.search.toLowerCase()) !== -1 ||
          congressmember.chamber.toLowerCase().indexOf(this.state.search.toLowerCase()) !== -1;
      }
    )

    let indexOfLastCongressmember = this.state.currentPage * this.state.congressmembersPerPage;
    let indexOfFirstCongressmember = indexOfLastCongressmember - this.state.congressmembersPerPage;
    let currentCongressmembers;
    let buttonClass = "hollow button numbers"
    let previousButton = "Previous"
    let nextButton = "Next"

    if (indexOfFirstCongressmember < 0 ) {
      currentCongressmembers = filteredCongressmembers.slice(0, 10);
    } else if (indexOfLastCongressmember > filteredCongressmembers.length) {
      currentCongressmembers = filteredCongressmembers.slice(filteredCongressmembers.length - 10, filteredCongressmembers.length)
    } else {
      currentCongressmembers = filteredCongressmembers.slice(indexOfFirstCongressmember, indexOfLastCongressmember);
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

    if (newCongressmembers.length < this.state.congressmembersPerPage) {
      buttonClass = ""
      previousButton = ""
      nextButton = ""
    }

    return (
      <div>
        <div className="row">
          <div className="small-12 columns medium-6 columns large-6 columns">
            <input
              className="searchBar"
              placeholder="Search"
              type="text"
              value={this.state.search}
              onChange={this.updateSearch}
            />
          </div>
        </div>
        <div className="expandable">
          <div className="cards-container">
            <div className="table-cards">
              {newCongressmembers}
            </div>
          </div>
        </div>
        <div className="text-center">
          <button className={buttonClass} onClick={this.previousPage}>
            {previousButton}
          </button>
          <button className={buttonClass} onClick={this.nextPage}>
            {nextButton}
          </button>
        </div>
      </div>
    )
  }
}

export default CongressmemberList;
