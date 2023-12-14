import { useQuery } from '@tanstack/react-query';
import { useContext } from 'react';
import { http } from '../api/api';
import { BibleContext } from '../context/bible/bibleContext';
import { BooksResponses } from '../interfaces/bibles/allBooksResponses';

const useBooks = () => {
  const {
    lecture: { version: v },
  } = useContext(BibleContext);

  const booksQuery = useQuery({
    queryKey: ['bible-books', { v }],
    queryFn: () =>
      http
        .get<BooksResponses>(`/bible/books?language=${v.language}&version=${v.name}`)
        .then((response) => response.data),
    cacheTime: Infinity,
    refetchOnWindowFocus: false,
    staleTime: Infinity,
  });

  return booksQuery;
};

export default useBooks;
