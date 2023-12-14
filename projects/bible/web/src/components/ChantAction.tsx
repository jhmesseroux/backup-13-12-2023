import React, { useRef } from 'react';
import { FullBook } from '../interfaces/ISongResponse';
import { Button } from 'primereact/button';
import { copyToClipboard } from '../helpers/general';

interface Props {
  chant: FullBook;
}

const ChantAction = ({ chant }: Props) => {

  const url = useRef(`${new URL(window.location.href).origin}/chant/${chant.songId}/${chant.title.replaceAll(' ', '-')}/${chant._id}`)

  return (
    <div className='flex items-center justify-center gap-4 flex-wrap mb-4'>
      {
        chant.videos.length > 0 && (
          <a target='_blank' href={chant.videos[0]}>
            <Button className="youtube bg-gray-300 hover:!bg-slate-800 text-slate-700 dark:bg-darkbox dark:hover:bg-slate-800 dark:text-brand border-none p-1" aria-label="Youtube"><i className="pi pi-youtube px-2"></i><span className="px-3">Refardez sur Youtube</span></Button>
          </a>
        )
      }
      <Button
        onClick={() => copyToClipboard(url.current)}
        className="youtube  bg-gray-300 hover:!bg-slate-800 text-slate-700 dark:bg-darkbox dark:hover:bg-slate-800 dark:text-brand dark:hover:text-gradient border-none p-1" aria-label="Youtube">
        <i className="pi pi-clone px-2"></i><span className="px-3">Copiez le lien</span>
      </Button>
      <a target='_blank' href={`https://wa.me/?text=${url.current}`}>

        <Button
          className="youtube  bg-gray-300 hover:!bg-slate-800 text-slate-700 dark:bg-darkbox dark:hover:bg-slate-800 dark:text-brand dark:hover:text-gradient border-none p-1" aria-label="Youtube">
          <i className="pi pi-whatsapp px-2"></i><span className="px-3">Whtasapp</span>
        </Button>
      </a>


      {/* <Button

        className='border-none'
      >
        <ShareIcon className='mr-2 h-5 w-5' />
        Patager
      </Button>
      <Button

        className='border-none'
      >
        <HeartIcon className='mr-2 h-5 w-5 text-gray-400' />
        {chant.likes} Aimer
      </Button>
      <Button

        className='border-none'
      >
        <HeartIcon className='mr-2 h-5 w-5 text-gray-400' />
        {chant.views} Vues
      </Button> */}
    </div>
  );
};

export default ChantAction;
