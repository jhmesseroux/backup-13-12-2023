import { useQuery } from '@tanstack/react-query';
import { http } from '../api/api';
import { VerseDayResponse } from '../interfaces/bibles/VerseOgTheDay';

const getVerseOfTheDay = async () =>
  await http.get<VerseDayResponse>('/verse-of-the-day/today/votd').then((resp) => resp);

export const useVerseOfTheDay = () => {
  const verseDayQuery = useQuery({
    queryKey: ['verse-of-the-day'],
    queryFn: getVerseOfTheDay,
    staleTime: 1000 * 60 * 60 * 24,
    cacheTime: 1000 * 60 * 60 * 24,
  });

  return verseDayQuery;
};
