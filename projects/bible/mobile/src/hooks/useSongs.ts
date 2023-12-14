import { useQuery } from '@tanstack/react-query';
import { http } from '../api/api';
import { ISongsBookResponse } from '../interfaces/ISongsBook';

export const getSongsByBook = async (CateId: number): Promise<ISongsBookResponse> => {
  const { data } = await http.get(`/songs?SongCategoryId=${CateId}&fields=id,title,num,language,lyrics,likes,video,lyricsHtml&sort=num&include=false`);
  return data;
};

export const useSongs = (id) => {
  const songsQuery = useQuery({
    queryKey: ['songs-categories', id],
    queryFn: () => getSongsByBook(id),
    cacheTime: Infinity,
    refetchOnWindowFocus: false,
    staleTime: Infinity,
  });

  return { songsQuery };
};
