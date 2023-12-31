// Generated by https://quicktype.io

import { ISong } from '../ISongsBook';

export interface FavouriteSongsResponse {
  results: number;
  code: number;
  status: string;
  ok: boolean;
  data: FaveItem[];
}

export interface FaveItem {
  id: number;
  uuid: string;
  UserId: number;
  SongId: number;
  createdAt: string;
  updatedAt: string;
  Song: ISong;
}
