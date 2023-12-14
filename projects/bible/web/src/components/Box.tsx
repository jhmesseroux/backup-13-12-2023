import React from 'react'

const Box = ({ children, className, style }: any) => {
  return (
    <div style={style} className={`bg-gray-100 text-slate-700 dark:bg-darkbox dark:text-darktext ${className}`}>{children}</div>
  )
}

export default Box