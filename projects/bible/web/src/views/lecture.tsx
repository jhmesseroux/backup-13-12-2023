import React, { useContext, useEffect, useState } from 'react'
import { useQuery } from '@tanstack/react-query'
import { Navigate, useNavigate, useParams } from 'react-router-dom'
import LectureHeader from '../components/bible/LectureHeader'
import NextAndPreviewChapter from '../components/bible/NextAndPreviewChapter'
import { http } from '../db/axios'
import Loading from '../components/Loading'
import ErrorApp from '../components/ErrorApp'
import { Verse, VersesChapterOfBook } from '../interfaces/bibles/versesChapterOfBook'
import Header from '../components/bible/Header'
import { Button } from 'primereact/button'
import { bookNumberAndChapters } from '../helpers/arrays'
import { BooksResponses } from '../interfaces/bibles/allBooksResponses'
import { BibleContext } from '../context/bibleContext'

const Lecture = () => {
  const { lecture } = useContext(BibleContext);

  const [selectedVerse, setSelectedVerse] = useState<Verse | null>(null)
  const [disabledPrev, setDisabledPrev] = useState(false);
  const [disabledNext, setDisabledNext] = useState(false);
  const { booknumber, detail } = useParams();
  const navigate = useNavigate()
  // console.log(booknumber, detail);

  const { isLoading, error, data, isError, isFetching } = useQuery({
    queryKey: ['bible', booknumber, detail],
    queryFn: (): Promise<VersesChapterOfBook> => http.get(`/bible/versesChapterOfBook/${booknumber}/${detail?.split('-')[1]}?language=${detail?.split('-')[2]}&version=${detail?.split('-')[3]}`).then((response) => response.data),
    cacheTime: Infinity,
    refetchOnWindowFocus: false,
    staleTime: Infinity
  })

  const { isLoading: isLoadingB, error: errorB, isError: isErrorB, data: books, refetch } = useQuery({
    queryKey: ['bible-books'],
    queryFn: (): Promise<BooksResponses> => http.get(`/bible/books?language=${lecture.version?.language}&version=${lecture.version?.name}`).then((response) => response.data),
    cacheTime: Infinity,
    refetchOnWindowFocus: false,
    staleTime: Infinity
  })

  useEffect(() => {
    if (Number(booknumber) <= 10 && Number(detail?.split('-')[1]) == 1) {
      setDisabledPrev(true);
    } else {
      setDisabledPrev(false);
    }
    if (Number(booknumber) >= 730 && Number(detail?.split('-')[1]) == 22) {
      setDisabledNext(true);
    } else {
      setDisabledNext(false);
    }
    return () => { }
  }, [detail, booknumber])


  const handleClickVerse = (v: Verse) => {
    setSelectedVerse(v);
    console.log(v)
  }

  const handleNextChapter = () => {
    let d = detail?.split('-')!;
    console.log(d)
    const currentBook: { book_number: number, chapters: number } = bookNumberAndChapters.find(v => v.book_number == Number(booknumber))!;
    if (currentBook != null && Number(d[1]) < currentBook?.chapters) {
      console.log(d)
      navigate(`/bible/${booknumber}/${d[0]}-${Number(d[1]) + 1}-${d[2]}-${d[3]}`);
    } else {
      let indexCurrentBox: number = bookNumberAndChapters.findIndex(b => b.book_number == Number(booknumber));
      let newBokkName = books?.books.find(book => book.book_number == bookNumberAndChapters[indexCurrentBox + 1].book_number);
      navigate(`/bible/${bookNumberAndChapters[indexCurrentBox + 1].book_number}/${newBokkName?.long_name}-${1}-${d[2]}-${d[3]}`);
    }
  }
  const handlePreviewChapter = () => {
    let d = detail?.split('-')!;
    console.log(detail?.split('-')!)
    const currentBook: { book_number: number, chapters: number } = bookNumberAndChapters.find(v => v.book_number == Number(booknumber))!;
    if (currentBook != null && Number(d[1]) > 1) {
      console.log(d)
      navigate(`/bible/${booknumber}/${d[0]}-${Number(d[1]) - 1}-${d[2]}-${d[3]}`);
    } else {
      console.log(d)
      let indexCurrentBox: number = bookNumberAndChapters.findIndex(b => b.book_number == Number(booknumber));
      console.log(indexCurrentBox)
      if (indexCurrentBox > 0) {
        let newBokkName = books?.books.find(book => book.book_number == bookNumberAndChapters[indexCurrentBox - 1].book_number);
        navigate(`/bible/${bookNumberAndChapters[indexCurrentBox - 1].book_number}/${newBokkName?.long_name}-${newBokkName?.chapters}-${d[2]}-${d[3]}`);
      }
    }
  }
  if (isLoading) return <Loading />
  if (isError) return <ErrorApp error={error} />
  return (
    <>
      <div className=' bg-green-600  w-2/2 sm:w-9/12 xl:w-6/12 sticky flex z-40 items-center justify-between left-0 m-auto top-1/2'>
        {/* get book detail and show pre and next depend on the chapters 
        
          get array of books [10,20,30]
        */}
        {
          !disabledPrev && (
            <Button
              onClick={handlePreviewChapter}
              icon="pi pi-angle-left" className="p-button-rounded p-button-info mx-4 fixed top-[70%] !z-30 left-0 !text-slate-700  !bg-gray-200 hover:!bg-gray-300 dark:!bg-darkbox dark:!text-darktext " aria-label="Preview" />

          )
        }

        {
          !disabledNext && (
            <Button
              onClick={handleNextChapter}
              icon="pi pi-angle-right" className="p-button-rounded p-button-info fixed top-[70%] mx-4 !z-30 right-0 !text-slate-700  !bg-gray-200 hover:!bg-gray-300 dark:!bg-darkbox dark:!text-darktext  " aria-label="Next" />

          )
        }

      </div>
      <Header books={books!} refetch={refetch} />
      <div className="sm:container m-auto my-6 sm:p-0 p-1 ">
        {/* <NextAndPreviewChapter /> */}
        <div className='verses-container  relative z-0  pb-12 m-auto w-full p-6 sm:p-0 sm:w-4/6 lg:w-1/2 xl:w-[32rem] '>
          <LectureHeader book={detail?.split('-')[0]!} chapter={detail?.split('-')[1]!} />
          {data.verses.map((v) => (
            <span
              key={v.text + v.verse.toString()}
              onClick={() => handleClickVerse(v)}
              className=' hover:underline   p-1 text-slate-700 dark:text-slate-400'
            >
              <sup className='text-xs text-gray-400 dark:text-blue-300 p-[4px]'>{v.verse}</sup>
              <span
                className='verse '
                dangerouslySetInnerHTML={{ __html: v.text }}
              />
            </span>
          ))}
        </div>
      </div>
    </>)
}

export default Lecture