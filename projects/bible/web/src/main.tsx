import React, { Children } from 'react'
import ReactDOM from 'react-dom/client'


import {
  createBrowserRouter,
  RouterProvider,
} from "react-router-dom";

import {
  QueryClient,
  QueryClientProvider,
} from '@tanstack/react-query'
import { ReactQueryDevtools } from '@tanstack/react-query-devtools'
import "primereact/resources/themes/lara-light-indigo/theme.css"
import "primereact/resources/primereact.min.css"
import "primeicons/primeicons.css"


import App from './App'
import './index.css'
import SongsCategoriesPage from './views/chants';
import NotFound from './views/notFound';
import Navbar from './components/Navbar';
import ChantDetails from './views/chantDetails';
import ChantLyrics from './views/chant';
import Bible from './views/bible';
import { BibleProvider } from './context/bibleContext';
import Lecture from './views/lecture';
import Videos from './views/videos';




const queryClient = new QueryClient()

const router = createBrowserRouter([
  {
    path: "/",
    element: <App />,
    errorElement: <NotFound />,
    children: [
      {
        path: "chants",
        element: <SongsCategoriesPage />,
      },
      {
        path: "chant/:songId/:title/:id",
        element: <ChantLyrics />,
      },
      {
        path: "chants/:slug/:id",
        element: <ChantDetails />,
      },
      {
        path: "bible/:booknumber/:detail",
        element: <Lecture />,
      },
      {
        path: "videos",
        element: <Videos />,
      },
      // {
      //   path: "bible/:booknumber/:detail",
      //   element: <Lecture />
      // }
    ]

  },

]);


ReactDOM.createRoot(document.getElementById('root') as HTMLElement).render(
  <React.StrictMode>
    <QueryClientProvider client={queryClient}>
      {/* <Navbar /> */}
      <BibleProvider>
        <RouterProvider router={router} />
      </BibleProvider>
      <ReactQueryDevtools initialIsOpen={false} />
    </QueryClientProvider>
  </React.StrictMode>,
)
