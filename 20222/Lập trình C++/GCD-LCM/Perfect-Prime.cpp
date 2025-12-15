//Perfect Prime Number
#include <bits/stdc++.h>
typedef long long ll;
using namespace std;
bool Test_Ngto(ll k) {	
	if(k<=1) return false;
	ll p = sqrt(k);
	for(ll i=2; i<=p; i++) {
		if( (k%i) ==0) return false;
	}
	return true;
}
bool Test_Dao(ll k) {
	ll p =0;
	while(k!=0) {
		int du = k%10;
		p = p*10 + du;
		k = k/10;
	}
	return(Test_Ngto(p));
}
bool Test_Tong(ll k) {
	ll s =0;
	while(k!=0) {
		int du = k%10;
		s = s + du;
		k = k/10;
	}
	return(Test_Ngto(s));
}
bool Test_Chuso(ll k) {	
	while(k!=0) {
		int du = k%10;
		if(Test_Ngto(du)==0) 
			return false;
		k = k/10;
	}
	return(true);
} 
bool Test(ll k) {
	if(Test_Ngto(k)==false) return false;
	ll p =0, s=0, du; 
	while(k!=0) {
		du = k%10;
		if(Test_Ngto(du)==false) return false;
		p = p*10 + du;
		s = s + du;
		k = k/10;
	}
	return(Test_Ngto(p) && Test_Ngto(s));
}
int Solution(int N) {
	ll Low = pow(10,N-1) +1;  
	ll High = pow(10,N) -1; 
	int ans =0;
	for(ll k = Low; k <=High; k = k + 2) {
		//if(Test_Ngto(k) && Test_Dao(k)&&Test_Tong(k)&& Test_Chuso(k)) {
		if(Test(k)) {		
			cout<<k<<endl;
			ans++;
		}
			
	}
	return ans;
}
int main(void) {
	int T, N; cin>>T;
	while(T--) {
		cin>>N;
		cout<<Solution(N)<<endl;
	}
}
