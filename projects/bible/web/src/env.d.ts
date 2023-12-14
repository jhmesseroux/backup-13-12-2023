/// <reference types="vite/client" />

interface ImportMetaEnv {
  readonly VITE_APP_TITLE: string
  readonly VITE_BASE_URL : string 
  readonly VITE_BEARER_TOKEN_BIBLE_CHANT_APP : string
  // más variables de entorno...
}

interface ImportMeta {
  readonly env: ImportMetaEnv
}
