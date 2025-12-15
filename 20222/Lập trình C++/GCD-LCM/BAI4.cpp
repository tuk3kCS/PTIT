// GCD(a, b) trong do b rat lon 
#include<bits/stdc++.h> 
using namespace std; 
typedef long long int ll; 
ll GCD(ll a, ll b) { //tinh GCD(a,b)
    if (!a) 
       return b; 
    return GCD(b%a,a); 
} 
ll reduceB(ll a, string  b) { //lay a mode b    
    ll mod = 0; //khoi tao mod la 0
    for (int i=0; i<b.length(); i++) //duyet cac chu so cua b
        mod = (mod*10 + b[i] - '0')%a;   
    return mod; // return modulo 
} 
ll gcdLarge(ll a, string b) {     
    ll num = reduceB(a, b); //num tro thanh so ll
    return GCD(a, num); 
} 
int main() { 
    ll a; int T; string  b; 
    cin>>T;
    while (T--){
    	cin>>a; cin>>b;
    	cout << gcdLarge(a, b)<<endl;	
	}     
} 

