// Generated by https://quicktype.io

import { IVersion } from './versionesResponses';

export interface IFavouritesVerses {
  results: number;
  code: number;
  status: string;
  ok: boolean;
  data: IFavouriteVerse[];
}

export interface IFavouriteVerse {
  id: number;
  uuid: string;
  verses: string;
  texts: IText[];
  bookName: string;
  chapter: number;
  note: null | string;
  color: string;
  type: string;
  createdAt: string;
  updatedAt: string;
  UserId: number;
  version: IVersion;
  visibility: string;
  bookNumber: number;
}

export interface IText {
  chapter: number;
  verse: number;
  text: string;
  book_number: number;
}