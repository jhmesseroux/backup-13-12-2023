import React, { useContext, useEffect, useLayoutEffect, useRef, useState } from 'react';
import { Dropdown } from 'primereact/dropdown';
import { BibleContext } from '../../context/bibleContext';
import { Book, BooksResponses } from '../../interfaces/bibles/allBooksResponses';
import { Version, VersionesResponses } from '../../interfaces/bibles/versionesResponses';
import { useNavigate, useParams, useRoutes } from 'react-router-dom';
import { http } from '../../db/axios';
import { useQuery } from '@tanstack/react-query';
import { InputText } from 'primereact/inputtext';
import Box from '../Box';
import { QueryClient } from '@tanstack/react-query'

interface Props {
  // detail: string;
  books: BooksResponses;
  refetch: any;
}




const Header = ({ books, refetch }: Props) => {
  const { lecture, updateBook, updateVersion, updateChapter } = useContext(BibleContext);

  const [showModal, setShowModal] = useState<Boolean>(false);
  const [selectedBook, setSelectedBook] = useState<null | Book>(null);
  const chaptersBook = useRef<number[]>([]);
  const [selectedVersion, setSelectedVersion] = useState<null | Version>(lecture.version);
  const [activeIndex, setActiveIndex] = useState(1);
  const navigate = useNavigate();
  const [filterBook, setFilterBook] = useState<Book[]>([])
  // const pathName = usePathname();
  const { detail, booknumber } = useParams()
  const [search, setSearch] = useState<string>(detail?.split('-')[0]! + ' ' + detail?.split('-')[1])

  const { isLoading, error, isError, data: versiones } = useQuery({
    queryKey: ['bible-versions'],
    queryFn: (): Promise<VersionesResponses> => http.get('/bible/versions').then((response) => response.data),
    cacheTime: Infinity,
    refetchOnWindowFocus: false,
    staleTime: Infinity
  })


  useEffect(() => {
    setSearch(detail?.split('-')[0]! + ' ' + detail?.split('-')[1])
    console.log('changes')
    return () => {

    }
  }, [detail, booknumber])

  useLayoutEffect(() => {
    // const element = document.querySelector('.books-chapters')!;
    // console.log(element)
    // const outsideClickListener = (event: any) => {
    //   if (!element.contains(event.target)) {
    //     element.classList.add('hidden');
    //     removeClickListener();
    //   }
    // };
    // const removeClickListener = () => {
    //   document.removeEventListener('click', outsideClickListener);
    // };

    // element.addEventListener('click', (event) => {
    //   event.stopPropagation();
    // });
    // document.addEventListener('click', outsideClickListener);

    return () => {

    };
  }, [])


  // const { isLoading: isLoadingB, error: errorB, isError: isErrorB, data: books, refetch } = useQuery({
  //   queryKey: ['bible-books'],
  //   queryFn: (): Promise<BooksResponses> => http.get(`/bible/books?language=${lecture.version?.language}&version=${lecture.version?.name}`).then((response) => response.data),
  //   cacheTime: Infinity,
  //   refetchOnWindowFocus: false,
  //   staleTime: Infinity
  // })


  const versionTemplate = (option: any) => {
    return (
      <div className='version-item'>
        <h3>
          <span className='font-bold'> {option.name}</span>
          <span className='text-xs'> ({option.longLanguage})</span>
        </h3>
        <span className='text-sm '>{option.description}</span>
      </div>
    );
  };
  const versionValueTemplate = (option: any, props: any) => {
    if (option) {
      return (
        <div className='version-item'>
          <h3 className='text-slate-700 dark:!text-darktext'>
            <span className='font-bold'> {option.name}</span>
            <span className='text-xs'> ({option.longLanguage})</span>
          </h3>
          {/* <span className='text-sm '>{option.description}</span> */}
        </div>
      );
    }
    return props.placeholder;
  };

  const getVersesChapter = async (chapter: number) => {
    setShowModal(false);
    updateBook(selectedBook!);
    updateChapter(chapter);
    setSearch(selectedBook?.long_name! + ' ' + chapter)

    navigate(`/bible/${selectedBook?.book_number}/${selectedBook?.long_name}-${chapter}-${lecture.version?.language}-${lecture.version?.name}`
    );
  };

  const handleOnChangeSearch = (e: any) => {
    setSearch(e.target.value);
    let res = books?.books.filter(book => book.long_name.toLocaleLowerCase().includes(e.target.value));
    if (res!.length > 0) {
      setFilterBook(res!);
    }
  }


  const queryClient = new QueryClient({
    defaultOptions: {
      queries: {
        staleTime: Infinity,
      },
    },
  })



  // 170,180,200,210,270.280,
  const handleVersionChange = async (e: any) => {
    setSelectedVersion(e.value);
    await updateVersion(e.value);
    setSearch('')
    refetch({ throwOnError: true })
    const res = await http.get(`/bible/books/${booknumber}?language=${e.value?.language}&version=${e.value?.name}`);
    console.log(res)
    setSelectedBook(res.data.book);
    // return
    navigate(`/bible/${booknumber}/${res.data.book.long_name}-${detail?.split('-')[1]}-${e.value?.language}-${e.value?.name}`
    );
  };

  return (
    <Box
      style={{ zIndex: 8 }}
      className='bible-header    border-t border-gray-300 dark:border-slate-600 sticky top-[70px] left-0 '>
      <div className='relative sm:w-3/4 w-full m-auto flex justify-center items-center gap-8 p-1'>

        <div className="current-lecture">
          <div className="input sm:w-60  border border-gray-300 bg-white dark:bg-slate-900 dark:border-slate-500 rounded-md relative">
            <input type="text" className="border-none p-3 bg-white dark:bg-transparent outline-none h-full w-full rounded-md " value={search} onChange={handleOnChangeSearch} />
            <span
              onClick={() => { setShowModal(!showModal) }}
              className="absolute right-0 top-0 cursor-pointer  h-full w-8 flex items-center justify-center">
              <i className="pi pi-chevron-down"></i>
            </span>
          </div>
        </div>

        <Dropdown
          value={selectedVersion}
          options={versiones?.versions}
          onChange={handleVersionChange}
          optionLabel='longLanguage'
          optionValue=''
          filter
          scrollHeight='400px'
          className='sm:w-60 w-1/2 bg-white dark:bg-slate-900 '
          filterBy='longLanguage'
          placeholder='choisir une version'
          filterPlaceholder='Creole,Français'
          itemTemplate={versionTemplate}
          valueTemplate={versionValueTemplate}
        />

        {showModal && (
          <div className='books-chapters absolute z-50 top-14  bg-white text-slate-800 m-auto shadow -translate-x-1/2 left-1/2 sm:w-[30rem] h-[325px] w-full   border border-gray-200'>
            <div className="flex   divide-x-2 justify-between h-full">
              <div className="bible-books  overflow-x-clip basis-1/2 h-full">
                <div className="bg-gray-200 dark:bg-darkbox dark:text-darktext w-full text-center p-1">Livre({(filterBook.length > 0 ? filterBook : books?.books)?.length})</div>
                <ul className='list-books -mr-4  hover:mr-0 flex flex-col overflow-y-scroll h-[290px]'>
                  {
                    (filterBook.length > 0 ? filterBook : books?.books)!.map(book => (
                      <li
                        key={book.long_name}
                        className={`bg-gray-100 p-2 border-b border-gray-100 hover:bg-gray-200 cursor-pointer ${book.long_name.toLocaleLowerCase()?.startsWith(selectedBook?.long_name?.toLocaleLowerCase()!) ? ' bg-gradient' : ''}`}
                        onClick={() => {
                          chaptersBook.current = [];
                          setSelectedBook(book);
                          setSearch(book.long_name);
                          for (let i = 1; i <= book.chapters; i++) {
                            chaptersBook.current.push(i);
                          }
                        }}
                      >
                        {book.long_name}
                      </li>
                    ))
                  }
                </ul>
              </div>
              <div className="basis-1/2 overflow-x-clip">
                <div className="bg-gray-200 dark:bg-darkbox dark:text-darktext w-full text-center p-1">Chapitres({chaptersBook.current.length})</div>

                <div className='flex chapters-list -mr-[8px]  hover:mr-0 content-start  flex-wrap  h-[290px]   overflow-y-auto'>
                  {chaptersBook.current.map((chapter) => (
                    <span
                      key={chapter}
                      onClick={() => getVersesChapter(chapter)}
                      className='border flex items-center justify-center flex-auto cursor-pointer w-11 h-11  text-center hover:bg-blue-400 hover:text-white border-gray-100 shadow'
                    >
                      {chapter}
                    </span>
                  ))}
                </div>
              </div>

            </div>
          </div>
        )}
      </div>
    </Box>

  );
};

export default Header;