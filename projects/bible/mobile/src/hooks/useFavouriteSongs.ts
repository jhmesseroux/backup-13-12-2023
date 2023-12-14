import { useContext } from 'react';
import { useQuery } from '@tanstack/react-query';
import { http } from '../api/api';
import { AuthContext } from '../context/auth/AuthContext';
import { FavouriteSongsResponse } from '../interfaces/chants/favouriteSongs';

export const deleteFavourite = async (id, token) => {
  const res = await http.delete(`/favorites-songs/${id}`, {
    headers: {
      Authorization: 'Bearer ' + token,
    },
  });

  return res.data;
};

export const useFavouriteSongs = () => {
  const { token, user } = useContext(AuthContext);
  console.log('entro');
  const favoriteSongs = useQuery({
    queryKey: ['user-favourite-songs', user?.id],
    queryFn: () =>
      http
        .get<FavouriteSongsResponse>(`/favorites-songs?UserId=${user.id}`, {
          headers: {
            Authorization: 'Bearer ' + token,
          },
        })
        .then((response) => response.data),
  });

  return favoriteSongs;
};
