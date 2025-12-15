// Phan so toi gian cua tich N phan so
#include <bits/stdc++.h> 
using namespace std;   
// Tim USCLN|(a,b)
int gcd(int a, int b) { 
    if (a == 0) 
        return b; 
    return gcd(b % a, a); 
}   
//giai phap giai quyet bai toan. 
void Solution(int n, int num[], int den[]) { 
    int new_num = 1, new_den = 1; //tu so & mau so moi  
    // tim tich cua N tu so va N mau so    
    for (int i = 0; i < n; i++) { 
        new_num *= num[i]; 
        new_den *= den[i]; 
    } 
  	//Tim USCLN(new_num, new_den)
    int GCD = gcd(new_num, new_den);   
    // Tim phan so ket qua duoi dang toi gian
    new_num /= GCD; 
    new_den /= GCD;   
    cout << new_num << "/" << new_den << endl; 
}   
// Test Solution
int main() { 
    int n = 3; 
    int num[] = { 1, 2, 5 }; 
    int den[] = { 2, 1, 6 };   
    Solution(n, num, den); 
    return 0; 
} 

