// Tim LCM va GCD 
#include <iostream>  
using namespace std; 
//tinh GCD(a, b) 
long long GCD(long long a, long long b){ 
    if (a == 0) 
        return b;  
    return GCD(b % a, a);  
}    
// tinh LCM(a,b) 
long long LCM(long long a, long long b){  
	long long n = a*b;
	long long  m = GCD(a,b);
    return n/ m;    
}  
// Test result  
int main() {  
    long long T, a, b; cin>>T;
    while(T--){
    	cin>>a>>b;
    	cout<<LCM(a,b)<<" "<<GCD(a,b)<<endl;
	}
}  

