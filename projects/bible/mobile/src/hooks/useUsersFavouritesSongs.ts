import { useQuery } from '@tanstack/react-query';
import { http } from '../api/api';
import { UserFavouriteSongResponse } from '../interfaces/users/IUserFavouriteSongsResponse';

export const useUsersFavouritesSongs = (UserId: number, SongId: number, token) => {
  const userFavouriteSongs = useQuery({
    queryKey: ['user-favourites-songs', { UserId, SongId }],
    queryFn: (): Promise<UserFavouriteSongResponse> =>
      http
        .get(`/favorites-songs/find?UserId=${UserId}&SongId=${SongId}&fields=id,UserId,SongId`, { headers: { Authorization: 'Bearer ' + token } })
        .then((response) => response.data),
    enabled: UserId !== undefined,
  });

  return userFavouriteSongs;
};
