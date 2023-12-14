// import { AuthState, initialState } from '../context/authContext';

export type types =
  | { type: 'signIn'; payload: any }
  | { type: 'finishChecking' }
  | { type: 'setfavouriteIcon'; payload: {} }
  | { type: 'signOut'; payload: any };

// export const authReducer = (state: AuthState, action: types): AuthState => {
//   switch (action.type) {
//     case 'signIn':
//       return {
//         ...state,
//         uid: action.payload.uid,
//         displayName: action.payload.displayName,
//         photoURL: action.payload.photoURL,
//         phoneNumber: action.payload.phoneNumber,
//       };
//     case 'signOut':
//       return initialState;
//     case 'finishChecking':
//       return {
//         ...state,
//         checking: false,
//       };
//     default:
//       return state;
//   }
// };
