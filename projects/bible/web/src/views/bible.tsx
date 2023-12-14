import React from 'react'
import { Outlet } from 'react-router-dom'
import Header from '../components/bible/Header'

const Bible = () => {
  return (
    <div>
      {/* <Header /> */}
      <Outlet />
    </div>
  )
}

export default Bible