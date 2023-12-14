import { useState } from 'react';
import { Outlet } from 'react-router-dom';
import './App.css';
import Navbar from './components/Navbar';

function App() {
  return (
    <div className='App bg-brand/80 min-h-screen !bg-gray-200 dark:!bg-gray-900'>
      <Navbar />
      <Outlet />
    </div>
  );
}


export default App;
