import React, { useState } from 'react';

const useForm = <T extends Object>(initialState: T) => {
  const [data, setData] = useState(initialState);

  const onChange = <K extends Object>(value: K, field: keyof T) => {
    setData({
      ...data,
      [field]: value,
    });
  };

  return {
    ...data,
    onChange,
    data
  };
};

export default useForm;
