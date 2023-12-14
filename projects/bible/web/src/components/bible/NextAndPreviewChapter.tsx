import React from 'react';

const NextAndPreviewChapter = () => {
  return (
    <div className=' bg-green-600 w-2/2 sm:!w-9/12 fixed flex items-center justify-between left-0 m-auto top-1/2'>
      <span className='bg-red-400 fixed left-0 p-1'>Previ</span>
      <span className='bg-red-400 fixed right-0 p-1'>Next</span>
    </div>
  );
};

export default NextAndPreviewChapter;
