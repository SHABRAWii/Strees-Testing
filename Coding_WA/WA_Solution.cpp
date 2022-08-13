#include <bits/stdc++.h>

using namespace std; 

#define FIO cin.tie(0),ios::sync_with_stdio(0),cout.tie(0)
#define oo __LONG_LONG_MAX__
#define ooi INT32_MAX
#define endl '\n'
typedef long long ll;

bool DB = 0;

int main(){ 
    #ifdef VS_FreeOpen 
        freopen("input.in", "r", stdin); 
        freopen("output.in", "w", stdout); 
        DB = 0;
    #endif 
    FIO; 

    int tc = 1;
    cin >> tc;
    while(tc--){
        int n = 0, m = 0;
        cin >> n >> m;
        int arr[n + 1] = {};
        for(int i = 1 ; i <= n ; ++i){
            cin >> arr[i];
        }
        int freq[n + 1] = {};
        int val[n + 1] = {};
        for(int i = 0 ; i < m ; ++i){
            int u, v;
            cin >> u >> v;
            ++freq[u];
            ++freq[v];
            if(val[u])
                val[u] = ((arr[val[u]] < arr[v]) ? val[u] : v);
            else
                val[u] = v;
            if(val[v])
                val[v] = ((arr[val[v]] < arr[u]) ? val[v] : v);
            else
                val[v] = u;
        }
        if(m % 2 == 0)
            cout << 0 << endl;
        else{
            ll x = oo;
            for(int i = 1 ; i <= n ; ++i){
                if(freq[i] & 1)
                    x = min(x, ll(arr[i]));
            }
            for(int i = 1 ; i <= n ; ++i){
                if(val[i] && freq[i] % 2 == freq[val[i]] % 2)
                x = min(x, ll(arr[i] + arr[val[i]]));
            }
            cout << x << endl;
        }
        
         int a;
    }

    return 0;
}
/*

*/