import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import CongressmemberList from './components/CongressmemberList';

$(function() {
  ReactDOM.render(
    <CongressmemberList />,
    document.getElementById('app')
  );
});
