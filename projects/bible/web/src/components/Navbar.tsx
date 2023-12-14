import React, { useContext, useEffect, useState } from 'react';
import { NavLink } from 'react-router-dom';
import LoggedUser from './users/LoggedUser';
// import LoggedUser from './LoggedUser';
import { InputSwitch } from 'primereact/inputswitch';
import { BibleContext } from '../context/bibleContext';
import { useQuery } from '@tanstack/react-query';
import { OneBookResponse } from '../interfaces/bibles/OneBookResponse';
import { http } from '../db/axios';

const Navbar = () => {

  // const { authState, signOut } = useContext(AuthContext);
  const [darkTheme, setDarkTheme] = useState(localStorage.theme === 'dark');
  const { lecture } = useContext(BibleContext);
  const { isLoading, error, isError, data } = useQuery({
    queryKey: ['one-book', lecture.version?.language, lecture.version?.name],
    queryFn: (): Promise<OneBookResponse> => http.get(`/bible/books/10?language=${lecture.version?.language}&version=${lecture.version?.name}`).then((response) => response.data),
    cacheTime: Infinity,
    refetchOnWindowFocus: false,
    staleTime: Infinity
  })



  const handleToggleTheme = (e: any) => {
    if (localStorage.theme === 'dark') {
      localStorage.theme = 'light'
      document.documentElement.classList.remove('dark')
      setDarkTheme(false)
    } else {
      localStorage.theme = 'dark'
      setDarkTheme(true)
      document.documentElement.classList.add('dark')
    }
  }

  return (
    <div className='sticky h-[70px] z-10 border-gray-100 dark:border-slate-700 border-b  px-3 sm:px-6 py-4 bg-gray-100 text-slate-700 dark:bg-slate-900  top-0 left-0 dark:text-brand'>
      <div
        id='menuHideShow'
        className='flex justify-between items-center xl:container m-auto'
      >
        <NavLink
          to='/'
          className='text-gradient-logo bg-gradient-to-r from-brand to-blue-500 hover:to-green-600'
        >
          <span >
            <span className='text-4xl'>B</span>
            <span className='text-2xl'>ow</span></span>
          <span>
            <span className='text-4xl'>D</span>
            <span className='text-2xl'>own</span>
          </span>
        </NavLink>
        <ul className='items-center gap-4 sm:flex hidden'>

          {[
            ['Bible', `/bible/10/${data?.book.long_name}-1-${lecture.version?.language}-${lecture.version?.name}`],
            ['Chant D\'esperans', '/chants'],
            ['Videos', '/videos'],
          ].map(([title, url]) => (
            <li
              key={url}
              className='text-base font-medium hover:bg-gray-200 dark:hover:bg-slate-700 py-[6px] px-[10px] rounded-full  cursor-pointer'
            >
              <NavLink
                className={({ isActive, isPending }) => {
                  return isActive ? "bg-gray-200 dark:bg-slate-700 py-[8px] px-[10px] rounded-full" : isPending ? "opacity-50 py-[6px] px-[10px]" : "py-[6px] px-[10px]";
                }}
                to={url}> {title} </NavLink>
            </li>
          ))}

        </ul>
        <div className='left-side-menu-header flex items-center justify-center gap-4'>
          <InputSwitch checked={darkTheme} onChange={handleToggleTheme} className='hidden sm:block' tooltip='changer de thème' tooltipOptions={{ position: 'bottom', mouseTrack: true, mouseTrackTop: 15 }} />
          <LoggedUser data={data} lecture={lecture} />
        </div>
      </div>
    </div>
  );
};

export default Navbar;
