import React from 'react';
import { Link } from 'react-router-dom';
// import { AuthState } from '../context/authContext';
import DefaultAvatar from './DefaultAvatar';

// type Props = {
//   authState: AuthState;
//   signOut: () => void;
// };
// { authState, signOut }: any

const LoggedUser = ({ data, lecture }: any) => {
  // const {
  //   data: { user },
  // } = authState;

  const user: any = {};

  const logoutUser = () => {
    // signOut();
    console.log('first');
  };

  return (
    <>
      <div
        style={{ zIndex: 10000 }}
        className='relative inline-block text-left '
      >
        <div
          onClick={() => {
            document.querySelector('.dropdown-user-logged-box')!.classList.toggle('hidden');
          }}
        >
          <button
            type='button'
            className='inline-flex justify-center items-center hover:bg-gray-200 w-full px-2 dark:hover:bg-slate-600  gap-2 py-1 text-sm font-medium text-gray-700 rounded-full transition-all  focus:outline-none'
            id='menu-button'
            aria-expanded='true'
            aria-haspopup='true'
          >
            {/* <span className='ml-2'>{user?.name?.split(' ')[0] || 'james'}</span> */}
            {user?.photo ? (
              <img
                src={user.photo}
                className='!w-9 !h-9 rounded-full overflow-hidden object-cover'
                alt={user?.name}
                width='36'
                height='36'
              />
            ) : (
              <DefaultAvatar />
            )}

          </button>
        </div>

        <div
          className='dropdown-user-logged-box border border-gray-200 dark:border-slate-600 text-slate-700 dark:text-darktext hidden transition-fade rounded-xl p-4 origin-top-right absolute top-[45px] right-0 mt-2 w-60 sm:w-72  shadow-lg bg-white dark:bg-darkbox'
          role='menu'
          aria-orientation='vertical'
          aria-labelledby='menu-button'
          tabIndex={-1}
        >
          <div
            className='py-1 flex flex-col  gap-1'
            role='none'
          >

            {[
              ['Bible', `/bible/10/${data?.book.long_name}-1-${lecture.version?.language}-${lecture.version?.name}`],
              ['Chant D\'esperans', '/chants'],
              ['Videos', '/videos'],
            ].map(([title, url, icon]) => (
              <Link
                to={url}
                key={url}
                className='text-base font-medium flex items-center gap-3 hover:bg-gray-200 dark:hover:bg-slate-700 rounded-lg py-[10px] px-[15px] cursor-pointer'
                role='menuitem'
                tabIndex={-1}
                id='menu-item-1'
              >
                <i className={icon}></i>
                <span>{title}</span>
              </Link>
            ))}
            <div className='border-b border-gray-200 dark:border-slate-600 rounded-full my-1 w-full'></div>
            <button
              onClick={logoutUser}
              type='button'
              className='text-red-700 dark:text-red-300 hover:rounded-xl flex items-center gap-3 w-full text-left px-2 py-2 text-sm hover:text-pink-600'
              role='menuitem'
              tabIndex={-1}
              id='menu-item-3'
            >
              <i className='pi pi-sign-out'></i>
              <span>Se déconnecter</span>
            </button>
          </div>
        </div>
      </div>
    </>
  );
};

export default LoggedUser;
