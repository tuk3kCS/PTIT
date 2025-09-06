#include <bits/stdc++.h> 
typedef long long int ll;
const long long int MAX = 1000000007;
//const long long int MAX = 17;
using namespace std;   
int GCD(int a, int b)  {
	while(b!=0){
		int r = a%b; a=b; b=r;
	}
	return a;
}
int GCDA(int A[], int n){
	int ans = A[0];
	for(int i=1; i<n; i++){
		ans = GCD(ans,A[i]);
	}
	return(ans);
}
ll Tich(int A[], int n){
	ll tich=1;
	for(int i=0; i<n; i++){
		tich = ((tich%MAX)*(A[i]%MAX))%MAX;
	}		
	return tich;
}
ll Luythua(int A[],  int n){
	ll ans = Tich(A,n);
	int k = GCDA(A, n);
	for(int i=1; i<k; i++){
		ans = (ans*ans)%MAX;
	}
	return ans;
}
int main(void){ 
	int A[100], T, N;cin>>T;
	while(T--){
		cin>>N;
		for(int i=0; i<N; i++) cin>>A[i];
		cout<<Luythua(A, N)<<endl;
	}
}
