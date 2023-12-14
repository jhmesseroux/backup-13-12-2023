import React from 'react'
import { useRouteError } from 'react-router-dom';
import Navbar from '../components/Navbar';
import { NotFoundPageError } from '../interfaces/general';

const NotFound = () => {
  const error: NotFoundPageError | any = useRouteError();
  console.log(error);
  return (
    <>

      <Navbar />
      <div id="error-page" className='bg-gray-100 dark:bg-darkbox text-slate-700 dark:text-darktext h-screen flex items-center justify-center  '>

        <div className="">

          <h1>Oops!</h1>
          <p>Désolé, une erreur inattendue s'est produite.</p>
          <p>
            <i>{error?.status}</i>
          </p>
          <i>{error?.error?.message}</i>
        </div>
      </div>
    </>

  )
}

export default NotFound


