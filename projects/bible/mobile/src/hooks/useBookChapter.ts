import React, { useState, useEffect } from 'react';
import { BibleAPI } from '../api/Bible';
import { ChaptersBookResponse } from '../interfaces/IBookChapter';
import { Book, BooksResponse } from '../interfaces/IVersions';
const useBookChapter = (book: Book, chapter: number) => {
  const [bookChapter, setBookChapters] = useState<ChaptersBookResponse>();
  const [loading, setLoading] = useState(true);

  const all = async () => {
    setLoading(true);
    try {
      const response = await BibleAPI.get<ChaptersBookResponse>(`/chapterOfBook/${book.book_number}/${chapter}`, {
        params: { language: 'ht' },
      });
      setBookChapters(response.data);
      // console.log(response.data);
    } catch (error) {
      if (error.response) {
        console.log(error.response);
      }
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    all();
    return () => {};
  }, []);

  return { bookChapter, loading };
};

export default useBookChapter;
