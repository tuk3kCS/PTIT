// Tim LCM cua 1, 2, .., n 
#include <bits/stdc++.h> 
using namespace std;   
typedef long long int ll; 
//tim USCLN(a,b)
ll  GCD(ll a, ll b) { 
    if (b == 0) 
        return a; 
    return GCD(b, a % b); 
}   
// Tim LCM cua 1, 2, .., n 
ll LCM( ll n) { 
    ll ans = 1; //ket qua LCM  
    for (ll i = 2; i <= n; i++) 
        ans = (((i * ans)) / 
                (GCD(i, ans))); 
  
    return ans; 
} 
// Test Result 
int main() {    
    ll T, n; cin>>T;
    while(T--){
    	cin>>n;
		cout<<LCM(n)<<endl;
	}
}
