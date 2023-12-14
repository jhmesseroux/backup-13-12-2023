import { useQuery } from '@tanstack/react-query';
import { http } from '../api/api';
import { VerseDayResponseList } from '../interfaces/bibles/VerseOgTheDay';

const getVerseOfTheDay = async () =>
  await http.get<VerseDayResponseList>('/verse-of-the-day').then((resp) => resp);

export const useVersesOfTheDays = () => {
  const versesDaysQuery = useQuery({
    queryKey: ['verses-of-the-days-list'],
    queryFn: getVerseOfTheDay,
  });

  return versesDaysQuery;
};
