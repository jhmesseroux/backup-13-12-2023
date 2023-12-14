import { useQuery } from '@tanstack/react-query';
import { http } from '../api/api';
import { ISongResponse } from '../interfaces/ISongResponse';

export const useSongDetails = (id: number) => {
  const songDetailsQuery = useQuery({
    queryKey: ['song', id],
    queryFn: () => http.get(`/songs/${id}?fields=id,likes`).then((response) => response.data),
    cacheTime: Infinity,
    refetchOnWindowFocus: false,
    staleTime: Infinity,
  });

  return songDetailsQuery;
};
