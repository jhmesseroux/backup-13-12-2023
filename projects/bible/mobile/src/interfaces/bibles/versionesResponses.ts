export interface IVersionsResponse {
  ok: boolean;
  status: string;
  code: number;
  results: number;
  data: IVersion[];
}

export interface IVersion {
  language: string;
  longLanguage: string;
  name: string;
  description: string;
  file: string;
}
