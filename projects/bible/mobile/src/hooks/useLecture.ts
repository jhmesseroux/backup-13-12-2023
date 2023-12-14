import { VersesChapterOfBook } from '../interfaces/bibles/versesChapterOfBook';
import { useQuery } from '@tanstack/react-query';
import { http } from '../api/api';
import AsyncStorage from '@react-native-async-storage/async-storage';
import { BibleContext, IlastLecture } from '../context/bible/bibleContext';
import { useContext } from 'react';
import { IVersion } from '../interfaces/bibles/versionesResponses';

export const getVersesBook = async (v: IVersion, ll: IlastLecture) => {
  const { data } = await http.get<VersesChapterOfBook>(`/bible/lecture/${ll.bookNumber}/${ll.chapter}?language=${v.language}&version=${v.name}`)
  // await AsyncStorage.setItem('lastLecture', JSON.stringify({ bookNumber: ll.bookNumber, chapter: ll.chapter }));

  return data;
};

const useLecture = (bookNumber: number | undefined, chapter: number | undefined) => {
  const { lecture, updateChapter } = useContext(BibleContext);
  console.log('lecturwe :: ', lecture)
  console.log('BOOK NUMER AND CHAPTER :: ', bookNumber, chapter)
  let lastLecture: IlastLecture;
  if (bookNumber && chapter) {
    console.log('entral primer')
    lastLecture = { bookNumber, chapter };
  } else {
    console.log('entral segundoooo')
    lastLecture = { bookNumber: lecture.book.book_number, chapter: lecture.chapter };
  }

  console.log('LAST LECTURE :: ', lastLecture)

  // updateChapter(chapter);
  const versesBookQuery = useQuery({
    queryKey: ['lecture', { bookNumber, chapter, version: lecture.version }],
    queryFn: () => getVersesBook(lecture.version, lastLecture),
    cacheTime: Infinity,
    // refetchOnWindowFocus: false,
    staleTime: Infinity,
  });

  return versesBookQuery;
};

export default useLecture;
