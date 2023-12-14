import React, { useState } from 'react';
import { ISong, ISongsBookResponses } from '../interfaces/ISongsBook';
import { TabView, TabPanel } from 'primereact/tabview';
import { useQuery } from '@tanstack/react-query';
import Loading from '../components/Loading';
import ErrorApp from '../components/ErrorApp';
import { useParams } from 'react-router-dom';
import { sortArrayByNumericKey } from '../helpers/arrays';
import Song from '../components/Song';
import { InputText } from 'primereact/inputtext';
import { DataTable } from 'primereact/datatable';
import { Column } from 'primereact/column';
import { http } from '../db/axios';
import { classNames } from 'primereact/utils';
import { Ripple } from 'primereact/ripple';

const ChantDetails = () => {

  const [search, setSearch] = useState<string>('');
  const [filtersData, setFiltersData] = useState<ISong[]>([])
  let { slug, id } = useParams();

  const { isLoading, error, data } = useQuery({
    queryKey: ['songs-categories', id],
    queryFn: (): Promise<ISongsBookResponses> => http.get(`/songs?book=${id}&limit=500&fields=title,num,songId,language`).then((response) => response.data),
    cacheTime: Infinity,
    refetchOnWindowFocus: false,
    staleTime: Infinity
  })

  const handleSearchSong = (e: React.ChangeEvent<HTMLInputElement>) => {
    setSearch(e.target.value);
    setFiltersData(data?.data.data.filter((item: ISong) => item.title.toLocaleLowerCase().includes(e.target.value.toLocaleLowerCase()) || item.num.toString().includes(e.target.value.toLocaleLowerCase()))!)
  };

  const TabHeaderTemplate = (options: any, q: number) => {
    return (
      <button type="button" onClick={options.onClick} className={options.className}>
        <i className="pi pi-prime mr-2" />
        {options.titleElement}({q})
      </button>
    )
  }
  const paginatorTemplate = {
    layout: 'PrevPageLink PageLinks NextPageLink',
    'PrevPageLink': (options: any) => {
      return (
        <button type="button" className={options.className} onClick={options.onClick} disabled={options.disabled}>
          <span className="p-3">Précédent</span>
          <Ripple />
        </button>
      )
    },
    'NextPageLink': (options: any) => {
      return (
        <button type="button" className={options.className} onClick={options.onClick} disabled={options.disabled}>
          <span className="p-3">Suivant</span>
          <Ripple />
        </button>
      )
    },
    'PageLinks': (options: any) => {
      if ((options.view.startPage === options.page && options.view.startPage !== 0) || (options.view.endPage === options.page && options.page + 1 !== options.totalPages)) {
        const className = classNames(options.className, { 'p-disabled': true });

        return <span className={className} style={{ userSelect: 'none' }}>...</span>;
      }

      return (
        <button type="button" className={options.className} onClick={options.onClick}>
          {options.page + 1}
          <Ripple />
        </button>
      )
    },
  };

  if (isLoading) return <Loading />

  if (error) return <ErrorApp error={error} />


  return (
    <div className='w-full p-4 sm:p-6 md:w-[750px] xl:w-[900px] m-auto '>
      <div className="p-input-icon-left rounded-xl w-full mb-4">
        <i className="pi pi-search" />
        <InputText
          placeholder="ekri nimewo ubyen tit chan , pa egzanp : 10,Gloire a Dieu,225"
          onChange={(e) => handleSearchSong(e)}
          className='!rounded-xl  w-full dark:bg-darkbox dark:border-slate-900/10 text-slate-800 dark:text-darktext '
          value={search} id='search' />
      </div>


      <TabView
        className='bg-gray-100  dark:bg-darkbox rounded-xl overflow-auto '
      >
        <TabPanel className='outline-none focus:outline-none border-none ring-0' header="Français" headerTemplate={(option) => TabHeaderTemplate(option, sortArrayByNumericKey(filtersData.length > 0 ? filtersData.filter((s: ISong) => s.language == 'fr') : data?.data.data.filter((s: ISong) => s.language == 'fr'), 'num').length)}>

          <DataTable
            value={sortArrayByNumericKey(filtersData.length > 0 ? filtersData.filter((s: ISong) => s.language == 'fr') : data?.data.data.filter((s: ISong) => s.language == 'fr'), 'num')}
            className='dark:text-darktext '
            paginator
            responsiveLayout="scroll"
            rows={20}
            paginatorTemplate={paginatorTemplate}
            emptyMessage='Aucun résultat trouvé'
          >
            <Column field="song_id" header="" body={(rowData) => (<Song song={rowData} />)}></Column>
          </DataTable>
        </TabPanel>
        <TabPanel header="Kreyol" headerTemplate={(option) => TabHeaderTemplate(option, sortArrayByNumericKey(filtersData.length > 0 ? filtersData.filter((s: ISong) => s.language == 'ht') : data?.data.data.filter((s: ISong) => s.language == 'ht'), 'num').length)} headerClassName="flex align-items-center">
          <DataTable
            value={sortArrayByNumericKey(filtersData.length > 0 ? filtersData.filter((s: ISong) => s.language == 'ht') : data?.data.data.filter((s: ISong) => s.language == 'ht'), 'num')}
            className=''
            emptyMessage='Aucun résultat trouvé'
            paginator
            responsiveLayout="scroll"
            rows={20}
            paginatorTemplate={paginatorTemplate}
          >
            <Column field="song_id" header="" body={(rowData) => (<Song song={rowData} />)}></Column>
          </DataTable>
        </TabPanel>

      </TabView>


    </div>
  );
};

export default ChantDetails;
