import React from 'react';
import { Avatar } from 'primereact/avatar';

const DefaultAvatar = () => {
  return (
    <div className='flex items-center gap-2'>
      <Avatar icon="pi pi-user" size="normal" className='bg-gradient' style={{ color: '#ffffff' }} shape="circle" />
      <i className='pi pi-align-right  dark:text-white'></i>
    </div>
  );
};

export default DefaultAvatar;
