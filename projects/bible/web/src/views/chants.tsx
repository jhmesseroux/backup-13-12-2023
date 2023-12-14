import { useQuery } from "@tanstack/react-query";
import Book from "../components/Book";
import ErrorApp from "../components/ErrorApp";
import Loading from "../components/Loading";
import { http } from "../db/axios";
import { BookResponses, IBook } from "../interfaces/Ibook";



const SongsCategoriesPage = () => {

  const { isLoading, error, data, isFetching } = useQuery({
    queryKey: ['chants-categories'],
    queryFn: () => http.get('/books'),
    cacheTime: Infinity,
    refetchOnWindowFocus: false,
    staleTime: Infinity
  })

  console.log({ isFetching }, { isLoading })
  if (isLoading) return <Loading />
  if (error) return <ErrorApp error={error} />


  return (
    <div className='songs-categories  flex items-center justify-center gap-6 p-4 sm:my-4  flex-wrap sm:container m-auto'>
      {data?.data.data.data.map((book: IBook) => (
        <Book
          book={book}
          key={book._id}
        />
      ))}
    </div>
  );
};

export default SongsCategoriesPage;
