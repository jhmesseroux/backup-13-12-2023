import { IUser } from '../../interfaces/users/renewToken';

export interface AuthState {
    status: 'checking' | 'authenticated' | 'not-authenticated';
    token: string | null;
    errorMessage: string;
    alertColor: string;
    alertMessage: string;
    user: IUser | null;
    showAlert: boolean;

}

type AuthAction =
    | { type: 'signUp', payload: { token: string, user: IUser } }
    | { type: 'addError', payload: string }
    | { type: 'toggleFlashAlert', payload: boolean }
    | { type: 'removeError' }
    | { type: 'notAuthenticated' }
    | { type: 'logout' }
    | { type: 'keepLogged' }
    | { type: 'updateFavouriteSongs' }
    | { type: 'updateUserData', payload: { username: string, email: string, photo: string } }
    | { type: 'updateAlertMessage', payload: string }
    | { type: 'updateAlertColor', payload: string }


export const authReducer = (state: AuthState, action: AuthAction): AuthState => {
    console.log('......................... INSIDE AUTH_REDUCER ..................')
    switch (action.type) {
        case 'addError':
            return {
                ...state,
                user: null,
                status: 'not-authenticated',
                token: null,
                errorMessage: action.payload
            }

        case 'removeError':
            return {
                ...state,
                errorMessage: ''
            };
        case 'updateAlertMessage':
            return {
                ...state,
                alertMessage: action.payload
            };
        case 'toggleFlashAlert':
            return {
                ...state,
                showAlert: action.payload
            };
        case 'updateAlertColor':
            return {
                ...state,
                alertColor: action.payload
            };

        case 'signUp':
            return {
                ...state,
                errorMessage: '',
                status: 'authenticated',
                token: action.payload.token,
                user: action.payload.user
            }
        case 'updateUserData':
            return {
                ...state,
                user: { ...state.user, username: action.payload.username, email: action.payload.email, photo: action.payload.photo }
            }
        case 'keepLogged':
            return {
                ...state,
                status: 'authenticated',
            }

        case 'logout':
        case 'notAuthenticated':
            return {
                ...state,
                status: 'not-authenticated',
                token: null,
                user: null
            }

        default:
            return state;
    }


}


