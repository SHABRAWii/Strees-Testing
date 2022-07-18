#include <bits/stdc++.h>

using namespace std; 

#define FIO cin.tie(0),ios::sync_with_stdio(0),cout.tie(0)
#define oo __LONG_LONG_MAX__
#define ooi INT32_MAX
#define endl '\n'
#define ll long long 

bool DB = 0;
const int N = 1e6 + 6;
int arr[N];
int main(){ 
    #ifdef VS_FreeOpen 
        freopen("input.in", "r", stdin); 
        // freopen("output.in", "w", stdout); 
        DB = 0;
    #endif  
    FIO; 
    int tc = 1;
    int xyz, aa = 1;
    cin >> tc;
    cout << tc + 1 << endl;
    return 0;
    while(tc--){
        int n, q;
        cin >> n >> q;
        for(int i = 0 ; i < n ; ++i){
            cin >> arr[n - 1 - i];
        }
        string str;
        int IQ = 0;
        for(int i = 0 ; i < n ; ++i){
            if(arr[i] > IQ && IQ < q){// Cant get Higher IQ contest
                ++IQ;
                str += '1';
            }else if(arr[i] <= IQ){
                str += '1';
            }else{
                str += '0';
            }
        }
        reverse(str.begin(), str.end());
        cout << str << endl;
        // while(1);
        // int x = 1e9;
        // while(x--);
        
        
    }

    return 0;
}
/*

*/