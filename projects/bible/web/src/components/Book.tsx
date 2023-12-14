import { FC } from 'react';
import { Link } from 'react-router-dom';
import { getColorBox } from '../helpers/general';
import { IBook } from '../interfaces/Ibook';
interface Props {
  book: IBook;
}
const Book: FC<Props> = ({ book }) => {
  return (
    <Link
      to={`/chants/${book?.slug}/${book?._id}`}
      className='book-item  text-slate-800 bg-white dark:bg-slate-800 dark:text-darktext  group hover:border-none  cursor-pointer w-80 items-center flex flex-col gap-4 p-6 hover:text-white hover:bg-gradient-to-r  from-cyan-500 to-blue-500  rounded-[1rem] border-gray-100 dark:border-slate-600 border dark:from-slate-600 dark:to-slate-700  hover:shadow-lg'
    >
      <div
        style={{ border: `1px solid ${getColorBox(book.abbreviation)}` }}
        className='w-20 h-20 rounded-full text-center group-hover:!border-white flex items-center justify-center  '
      >
        <span className='text-2xl font-extrabold   opacity-80 '>{book.abbreviation}</span>
      </div>
      <span className='text-2xl font-bold text-center'>{book.name}</span>
    </Link>
  );
};
export default Book;
