#include <iostream>
#include <fstream>
#define MAX 100000
using namespace std;
struct WORD {
	string tu;
	int solan;
};
int Search(WORD X[], int n, string s) {	
	for(int i=1; i<=n; i++) {
		if(X[i].tu==s) return i;
	}
	return n+1;
}
void Result(WORD X[], int n){
	ofstream fp("ketqua.out");
	cout<<"So tu:"<<n<<endl;
	fp<<n<<endl;
	for(int i=1; i<=n; i++) {
		cout<<X[i].tu<<"  "<<X[i].solan<<endl;
		fp<<X[i].tu<<"  "<<X[i].solan<<endl;
	}
	fp.close();
}
int Taptu(char *name, WORD X[], int n){
	ifstream fp(name);		
	string s;
	while(!fp.eof()) {
		fp>>s;	
		int k = Search(X, n, s);
		if(k<=n) {
			X[k].solan ++; 
		}
		else {
			n = k;
			X[k].tu = s; 
			X[k].solan = 1;
			
		}
	}
	fp.close(); return n;
}
int main(void) {
	char name1[] = "DATA1.IN";
	char name2[] = "DATA2.IN";
	WORD X[MAX];
	int n=0; 
	n = Taptu(name1, X, n);
	n = Taptu(name2,X,n);
	Result(X,n);
}
