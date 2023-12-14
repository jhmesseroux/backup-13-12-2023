'use client';
import React, { createContext, useEffect, useState } from 'react';
import Loading from '../components/Loading';
import { Book } from '../interfaces/bibles/allBooksResponses';
import { Verse } from '../interfaces/bibles/versesChapterOfBook';
import { Version } from '../interfaces/bibles/versionesResponses';

export interface BibleState {
  book: Book | null;
  verses: Verse[] | [];
  version: Version | null;
  chapter: number | null;
}

export const defaultVersion: Version = {
  language: "fr",
  longLanguage: "Français",
  name: "FRC97",
  description: "La Bible en français courant",
  file: "FRC97.SQLite3"
};

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
  updateVersion: (version: Version) => void;
  updateChapter: (chap: number) => void;
}
// const defaultTheme = DarkTheme;

export const BibleContext = createContext({} as LectureContextProps);

export const BibleProvider = ({ children }: any) => {
  const [lecture, setLecture] = useState<BibleState>(initialState);
  const [loadingApp, setLoadingApp] = useState(true)

  useEffect(() => {
    lecture.version = localStorage?.getItem('bibleVersion') ? JSON.parse(localStorage?.getItem('bibleVersion')!) : defaultVersion;
    console.log('version from context : ', lecture.version);
    setLoadingApp(false);
    return () => { };
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
    setLecture((prev) => ({
      ...prev,
      version: v,
    }));
    localStorage.setItem('bibleVersion', JSON.stringify(v));
  };

  if (loadingApp) return <Loading />

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
