// Generated by https://quicktype.io

import { IVersion } from './versionesResponses';
export interface BooksResponses {
  ok: boolean;
  results: number;
  status: boolean;
  code: number;
  data: { books: Book[]; version: IVersion };
}
export interface Book {
  book_number: number;
  short_name: string;
  long_name: string;
  chapters: number;
  verses: number;
}
