// GCD(a, x, y): x, y la so lan lap lai a
#include<bits/stdc++.h> 
typedef long long int ll;
using namespace std;  
// tim USCLN cua a va b 
ll gcd(ll a, ll b) { 
    if (a == 0) 
        return b; 
    return gcd(b%a, a); 
} 
void findgcd(ll a, ll x, ll y) { 
    // tim GCD(x,y) 
    ll g = gcd(x,y);   
    // in a g lan. 
    for (int i = 0; i < g; i++) 
        cout <<a; 
    cout<<endl;
} 
  
// Test solution 
int main() { 
	ll T, a, x, y;cin>>T;
	while(T--){
		cin>>a>>x>>y;
		findgcd(a,x,y);	
	}
} 
