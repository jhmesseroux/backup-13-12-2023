// Generated by https://quicktype.io
import { Version } from './versionesResponses';

export interface VersesChapterOfBook {
  ok: boolean;
  results: number;
  status: boolean;
  code: number;
  data: {
    version: Version;
    verses: IVerse[];
  };
}

export interface IVerse {
  book_number: number;
  chapter: number;
  verse: number;
  text: string;
  startVerseTitle?: number;
  titles?: string[];
}
