// Tim boi so chung nho nhat cua n phan tu
#include <bits/stdc++.h> 
using namespace std;   
typedef long long int ll; 
  
// tim USCLN cua a va b
int gcd(int a, int b) { 
    if (b == 0) 
        return a; 
    return gcd(b, a % b); 
} 
  
// Tim boi so chung nho nhat cua n phan tu 
ll findlcm(int arr[], int n) { 
    // lay phan tu dau tien 
    ll ans = arr[0];   
    //tim boi so chung nho nhat cua n phan tu
    for (int i = 1; i < n; i++) 
        ans = (((arr[i] * ans)) / 
                (gcd(arr[i], ans)));   
    return ans; 
}   
// Test solution 
int main() { 
    int arr[] = { 2, 7, 3, 9, 4 }; 
    int n = sizeof(arr) / sizeof(arr[0]); 
    printf("%lld", findlcm(arr, n)); 
    return 0; 
}
