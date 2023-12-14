import { useQuery } from '@tanstack/react-query';
import { Button } from 'primereact/button';
import React from 'react'
import { useNavigate, useParams } from 'react-router-dom';
import ChantAction from '../components/ChantAction';
import ErrorApp from '../components/ErrorApp';
import Loading from '../components/Loading';
import { http } from '../db/axios';
import { ISongResponse } from '../interfaces/ISongResponse';

const ChantLyrics = () => {
  let { songId, title, id } = useParams();
  const navigate = useNavigate()
  const { isLoading, error, isError, data } = useQuery({
    queryKey: ['chant', id],
    queryFn: (): Promise<ISongResponse> => http.get(`/songs/${id}`).then((response) => response.data),
    cacheTime: Infinity,
    refetchOnWindowFocus: false,
    staleTime: Infinity
  })

  if (isLoading) return <Loading />
  if (isError) return <ErrorApp error={error} />
  return (
    <div className='relative overflow-hidden  flex flex-col gap-6 my-6 items-center sm:container m-auto justify-center p-4 sm:p-0 '>


      <div className='chant-action text-center'>
        <h3 className='mb-4 text-center flex items-center justify-center gap-2 text-2xl sm:text-4xl'>
          {/* <Button icon="pi pi-arrow-left" className="p-button-rounded p-button-outlined text-white" aria-label="Submit" /> */}
          <span
            onClick={() => navigate(-1)}
            className='w-8 h-8 rounded-full text-slate-700 hover:bg-gray-400 cursor-pointer dark:hover:bg-slate-600 text-center flex items-center justify-center'>
            <i className='pi pi-arrow-left dark:text-white'  ></i>
          </span>
          <span className='ml-4 text-gradient !mb-0'>
            {data.data.data.title}
          </span>
        </h3>
        <h6 className='text-slate-800 dark:text-darktext font-semibold mb-4'>
          {data.data.data.num} - {data.data.data.book.name}
        </h6>
        <ChantAction chant={data.data.data} />
      </div>
      {/* <div className='lyrics'>{data.lyrics}</div>
      <div className='lyrics'>{data.lyricsHtml}</div>
      <div className='lyrics'>{data.lyricsMarkdown}</div> */}
      <div
        className='chant-lyrics flex flex-col items-center text-center text-slate-700 dark:text-darktext '
        dangerouslySetInnerHTML={{ __html: data.data.data.lyricsHtml }}
      />
    </div>
  )
}

export default ChantLyrics