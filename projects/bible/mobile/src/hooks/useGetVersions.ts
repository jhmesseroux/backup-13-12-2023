import { useQuery } from '@tanstack/react-query';
import { http } from '../api/api';
import { IVersionsResponse } from '../interfaces/bibles/versionesResponses';
const useVersions = () => {
  const versionQuery = useQuery({
    queryKey: ['bible-versions'],
    queryFn: () => http.get<IVersionsResponse>('/bible/versions').then((response) => response.data),
    cacheTime: Infinity,
    refetchOnWindowFocus: false,
    staleTime: Infinity,
  });

  return versionQuery;
};

export default useVersions;
