// Generated by https://quicktype.io

export interface VersionesResponses {
  result: number;
  versions: Version[];
}

export interface Version {
  language: string;
  longLanguage: string;
  name: string;
  description: string;
  file: string;
}
