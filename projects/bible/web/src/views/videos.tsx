import { QueryClient, useQueries, useQuery } from '@tanstack/react-query'
import React from 'react'
import { http } from '../db/axios'

const Videos = () => {

  const { data, isLoading, error } = useQuery({
    queryKey: ['devotions'],
    queryFn: () => http.get('/devotions').then((response) => response.data)
  })

  console.log(error)
  console.log(data)
  return (
    <div>Videos

      <div className="">

        {data?.books?.slice(1, 2).map((dev: any) => (
          // <span>hello</span>
          <div className='text-slate-700' dangerouslySetInnerHTML={{ __html: dev.devotion }} />
        ))}
      </div>
    </div>

  )
}

export default Videos