import React from 'react'

const ErrorApp = ({ error }: { error: any }) => {
  console.log(error)
  return (
    <div className='my-6 text-center text-red-400'>
      <h1>{error.response.data.message}</h1>
    </div>
  )
}

export default ErrorApp