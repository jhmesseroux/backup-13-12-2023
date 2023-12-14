import axios from "axios";


export const http = axios.create( {
  baseURL : import.meta.env.VITE_BASE_URL ,
  headers: {
    'Content-type': 'application/json',
    Authorization : 'Bearer ' + import.meta.env.VITE_BEARER_TOKEN_BIBLE_CHANT_APP
  },
} )
// export const httpBible = axios.create( {
//   baseURL : import.meta.env.VITE_BASE_URL ,
//   headers: {
//     'Content-type': 'application/json',
//     Authorization : 'Bearer ' + import.meta.env.VITE_BEARER_TOKEN_BIBLE_CHANT_APP
//   },
// } )