// Generated by https://quicktype.io

export interface OneBookResponse {
  ok:      boolean;
  code:    number;
  version: Version;
  book:    Book;
}

export interface Book {
  book_color:  string;
  book_number: number;
  short_name:  string;
  long_name:   string;
}

export interface Version {
  language:     string;
  longLanguage: string;
  name:         string;
  description:  string;
  file:         string;
}
