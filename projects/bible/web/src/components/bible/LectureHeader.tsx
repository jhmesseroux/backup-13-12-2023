import React, { useContext } from 'react';
import { BibleContext } from '../../context/bibleContext';


interface Props {
  book: string;
  chapter: string;
}
const LectureHeader = ({ book, chapter }: Props) => {
  const { lecture } = useContext(BibleContext);

  return (
    <div className=' text-center text-2xl sm:text-4xl'>
      <span className='text-gradient dark:bg-gradient dark:bg-gradient-to-tr dark:from-slate-500 dark:to-brand block '>
        {book} - {chapter}
      </span>
    </div>
  );
};

export default LectureHeader;
