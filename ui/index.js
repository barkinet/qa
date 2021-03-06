import React from 'react'
import ReactDOM from 'react-dom'
import { Provider } from 'react-redux'
import thunk from 'redux-thunk'
import { applyMiddleware, createStore } from 'redux'

import './polyfills'

import App from './App'
import Infobox from './Infobox'
import UserDropdown from './navbar/UserDropdown'
import reducer from './reducer'


// NOP for now
let store = createStore(reducer, applyMiddleware(thunk))

let rootApp = (
  <Provider store={store}>
    <App />
  </Provider>
)
let target = document.getElementById('root')

if (target != undefined) {
  ReactDOM.render(rootApp, target)
}

// TODO: eventually remove all the below:
window.ReactDOM = ReactDOM

$(document).ready(() => {
  const elems = document.getElementsByClassName('react-user-info')
  Array.from(elems).forEach((elem) => {
    const asked = elem.getAttribute('data-asked')
    const display_name = elem.getAttribute('data-display-name')
    const gravatar = elem.getAttribute('data-gravatar')
    const reputation = elem.getAttribute('data-reputation')
    const user_link = elem.getAttribute('data-user-link')
    ReactDOM.render(<Infobox
      asked={asked}
      display_name={display_name}
      gravatar={gravatar}
      reputation={reputation}
      user_link={user_link} />, elem)
  })

  const userDropdownRoot = document.getElementById('react-user-dropdown')
  if (userDropdownRoot != undefined) {
    const csrf = userDropdownRoot.getAttribute('data-csrf')
    const display_name = userDropdownRoot.getAttribute('data-display-name')
    const edit_link = userDropdownRoot.getAttribute('data-edit-link')
    const logout_button = userDropdownRoot.getAttribute('data-logout-button')
    const profile_link = userDropdownRoot.getAttribute('data-profile-link')
    ReactDOM.render(<UserDropdown csrf={csrf} display_name={display_name} edit_link={edit_link} logout_button={logout_button} profile_link={profile_link} />, userDropdownRoot)
  }
})
