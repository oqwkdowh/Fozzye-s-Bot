import type { AuthenticationState } from '../Types/index.js';
export declare const useSingleFileAuthState: (filePath: string) => Promise<{
    state: AuthenticationState;
    saveCreds: () => Promise<void>;
}>;
//# sourceMappingURL=use-single-file-auth-state.d.ts.map