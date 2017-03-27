import React from 'react';
import { PROPUBLICA_API_KEY } from 'react-native-dotenv'

class App extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      congressmembers: [],
    }
    this.getData = this.getData.bind(this);
  }

  getData() {
    fetch("https://api.propublica.org/congress/v1/members.json", {
      method: 'GET',
      headers: {
        'X-API-Key:': PROPUBLICA_API_KEY
      }}).then(response => {
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
      this.setState({congressmembers: body["results"["members"]]});
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  componentDidMount() {
  ApiClient.init(PROPUBLICA_API_KEY)
  this.getData();
  }

  render() {
    let members = this.state.congressmembers.map((congressmember, index) => {
      return (
        <Congressmember
          id={congressmember.id}
          key={congressmember.id}
          first_name={congressmember.first_name}
          last_name={congressmember.last_name}
        />
      )
    });

    return(
      <div className="id">
        <h2>No worries!</h2>
        {members}
      </div>
    )
  }
};

export default App;
