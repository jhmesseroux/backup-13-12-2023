import { useContext } from 'react';
import { useQuery } from '@tanstack/react-query';
import { http } from '../api/api';
import { AuthContext } from '../context/auth/AuthContext';
import { IFavouritesVerses } from '../interfaces/bibles/FavouritesVerses';
import { TYPE } from '../helpers/enums';
// import { FavouriteVersesResponse } from '../interfaces/chants/FavouriteVerses';

export const deleteFavourite = async (id, token) => {
  const res = await http.delete(`/favorites-songs/${id}`, {
    headers: {
      Authorization: 'Bearer ' + token,
    },
  });

  return res.data;
};

export const useFavouriteVerses = (type: TYPE = undefined) => {
  const { token, user } = useContext(AuthContext);
  const favouriteVerses = useQuery({
    queryKey: ['user-favourite-verses', user?.id, type],
    queryFn: () =>
      http
        .get<IFavouritesVerses>(`/bible/favourites?UserId=${user?.id}${type !== undefined && ('&type=' + type)}`, {
          headers: {
            Authorization: 'Bearer ' + token,
          },
        })
        .then((response) => response.data),
  });

  return favouriteVerses;
};
