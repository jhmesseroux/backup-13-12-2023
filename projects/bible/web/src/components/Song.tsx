
import React, { FC } from 'react';
import { Link } from 'react-router-dom';
import { ISong } from '../interfaces/ISongsBook';

interface PropsSong {
  song: ISong;
}

const Song: FC<PropsSong> = ({ song }) => {
  return (
    <Link
      to={`/chant/${song.songId}/${song.title.replaceAll(' ', '-')}/${song._id}`}
      className='song'
      key={song._id}
    >
      <div className='song-body h-full border-b hover:bg-gray-200  border-gray-100 dark:hover:bg-slate-700 dark:border-gray-800 p-2 w-full bg-white dark:bg-slate-800 dark:text-gray-400  song text-gray-700  '>
        <span>
          {song.num} - {song.title}
        </span>
      </div>
    </Link>
  );
};
export default Song;
