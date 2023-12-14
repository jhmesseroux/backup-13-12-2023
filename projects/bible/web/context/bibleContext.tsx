'use client';
import React, { createContext, useEffect, useState } from 'react';
import { Book, Version } from '@/interfaces/bibles/allBooksResponses';
import { Verse } from '@/interfaces/bibles/versesChapterOfBook';
export interface BibleState {
  book: Book | null;
  verses: Verse[] | [];
  version: Version | null;
  chapter: number | null;
}

export const initialState = {
  book: null,
  verses: [],
  version: null,
  chapter: null,
};
export interface LectureContextProps {
  lecture: BibleState;
  update: (lecture: BibleState) => void;
  updateBook: (book: Book) => void;
  updateVersion: (book: Version) => void;
  updateChapter: (chap: number) => void;
}
// const defaultTheme = DarkTheme;

export const BibleContext = createContext({} as LectureContextProps);

export const BibleProvider = ({ children }: any) => {
  const [lecture, setLecture] = useState<BibleState>(initialState);

  useEffect(() => {
    lecture.version = localStorage?.getItem('bibleVersion') ? JSON.parse(localStorage?.getItem('bibleVersion')!) : null;
    console.log(JSON.parse(localStorage?.getItem('bibleVersion')!));
    return () => {};
  }, []);

  const update = (t: BibleState) => setLecture(t);
  const updateBook = (book: Book) =>
    setLecture((prev) => ({
      ...prev,
      book,
    }));
  const updateChapter = (chapter: number) =>
    setLecture((prev) => ({
      ...prev,
      chapter,
    }));
  const updateVersion = (v: Version) => {
    localStorage.setItem('bibleVersion', JSON.stringify(v));
    setLecture((prev) => ({
      ...prev,
      v,
    }));
  };

  return (
    <BibleContext.Provider
      value={{
        lecture,
        update,
        updateBook,
        updateVersion,
        updateChapter,
      }}
    >
      {children}
    </BibleContext.Provider>
  );
};
