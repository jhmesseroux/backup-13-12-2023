import React, { useState } from 'react';

const useForm = <T extends Object>(initialState: T) => {
  const [data, setData] = useState(initialState);

  const reset = () => {
    setData(initialState);
  }

  const onChange = <K extends Object>(e: any) => {
    setData({
      ...data,
      [e.target.name]: e.target.value,
    });
  };

  return {
    ...data,
    onChange,
    data,
    reset
  };
};

export default useForm;
