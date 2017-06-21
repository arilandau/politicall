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
    fetch('api/v1/congressmembers', {method: 'get'})
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
    let previousClass = "hollow button"
    let nextClass = "hollow button"
    let previous = "⇦"
    let next = "⇨"


    if (indexOfFirstCongressmember < 0 ) {
      currentCongressmembers = this.state.congressmembers.slice(0, 10);
    } else {
      currentCongressmembers = this.state.congressmembers.slice(indexOfFirstCongressmember, indexOfLastCongressmember)
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
          <button className={previousClass} onClick={this.previousPage}>
            {previous}
          </button>
          <div id="spacer">    </div>
          <button className={nextClass} onClick={this.nextPage}>
            {next}
          </button>
        </div>
      </div>
    )
  }
}

export default CongressmemberList;
