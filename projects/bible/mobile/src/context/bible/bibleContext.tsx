import React, { createContext, useEffect, useState } from 'react';
import AsyncStorage from '@react-native-async-storage/async-storage';
import { Book } from '../../interfaces/bibles/allBooksResponses';
import { IVerse } from '../../interfaces/bibles/versesChapterOfBook';
import { IVersion } from '../../interfaces/bibles/versionesResponses';


export interface IlastLecture {
  bookNumber: number; chapter: number
}
export interface BibleState {
  book: Book | null;
  verses: IVerse[] | [];
  version: IVersion | null;
  chapter: number | null;
  lastLecture: IlastLecture | null
}

export const initialState = {
  book: null,
  verses: [],
  version: null,
  chapter: null,
  lastLecture: null
};
export interface LectureContextProps {
  lecture: BibleState;
  update: (lecture?: BibleState) => void;
  updateBook: (book: Book) => void;
  updateVersion: (version: IVersion) => void;
  updateChapter: (chap: number) => void;
  updateLastLecture: (lastLecture: IlastLecture) => void;
}


export const DEFAULT_VERSION = {
  language: 'fr',
  longLanguage: 'Français',
  name: 'LSG',
  description: 'Bible Segond 1910',
  file: 'LSG.SQLite3',
}

export const DEFAULT_BOOK = {
  book_number: 10,
  short_name: "Gn",
  long_name: "Genèse",
  book_color: "#ccccff",
  sorting_order: 100

}
// const defaultTheme = DarkTheme;

export const BibleContext = createContext({} as LectureContextProps);

export const BibleProvider = ({ children }: any) => {
  const [lecture, setLecture] = useState<BibleState>(initialState);

  useEffect(() => {
    setDefaultValues().then(() => { }).catch(() => { })
    return () => { };
  }, [lecture]);


  const setDefaultValues = async () => {
    // const keys = await AsyncStorage.getAllKeys()
    // const keys2 = await AsyncStorage.multiGet(keys)
    // console.log('keys :: ', keys, 'keys2 :: ', keys2)
    lecture.version = JSON.parse(await AsyncStorage.getItem('bibleVersion')) || DEFAULT_VERSION;
    lecture.lastLecture = JSON.parse(await AsyncStorage.getItem('lastLecture')) || { bookNumber: 10, chapter: 1 };
    lecture.book = JSON.parse(await AsyncStorage.getItem('lastBook')) || DEFAULT_BOOK;
    lecture.chapter = Number(await AsyncStorage.getItem('lastChapter')) || 1;
  }

  console.log('lecturwe :: ', lecture)

  const update = async (t: BibleState) => {
    if (t) {

      console.log('entrooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo')
      setLecture(t)
    }
    else {
      console.log('enteeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee')
      await setDefaultValues()
    }
  };

  const updateBook = async (book: Book) => {
    setLecture((prev) => ({ ...prev, book }));
    await AsyncStorage.setItem('lastBook', JSON.stringify(book));
  };

  const updateChapter = async (chapter: number) => {

    setLecture((prev) => ({
      ...prev,
      chapter,
    }));
    await AsyncStorage.setItem('lastChapter', chapter.toString());

  }



  const updateVersion = async (v: IVersion) => {
    setLecture((prev) => ({
      ...prev,
      version: v,
    }));
    await AsyncStorage.setItem('bibleVersion', JSON.stringify(v));
  };

  const updateLastLecture = async (ll: IlastLecture) => {
    setLecture((prev) => ({
      ...prev,
      lastLecture: ll,
    }));
    await AsyncStorage.setItem('lastLecture', JSON.stringify(ll));
  };

  return (
    <BibleContext.Provider
      value={{
        lecture,
        update,
        updateBook,
        updateVersion,
        updateChapter,
        updateLastLecture
      }}
    >
      {children}
    </BibleContext.Provider>
  );
};
