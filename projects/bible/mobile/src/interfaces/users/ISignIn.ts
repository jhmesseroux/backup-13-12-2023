// Generated by https://quicktype.io

import { IUser } from './renewToken';

// export interface SignInResponse {
//   status: string;
//   token: string;
//   data: Data;
// }

// export interface Data {
//   user: IUser;
// }

export interface SignInput {
  email: string;
  password: string;
}
export interface SignUpInput extends SignInput {
  username: string;
}
