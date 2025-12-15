#include <iostream>
#include <fstream>
#define MAX 100000
using namespace std;
struct WORD { //dinh ngia cau truc tu
	string tu; //dinh nghia mot tu
	int solan;//so lan xuat hien tu
};
//tim tu s trong tap tu X[]
int Search(WORD X[], int n, string s) {	
	for(int i=1; i<=n; i++) {//
		if(X[i].tu==s) return i;
	}
	return n+1;
}
//dua ra file ket qua
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
void Instersection(char *name1, char *name2) {	
	WORD X1[10000], X2[10000], X3[10000];
	int n1=0, n2=0, n3=0;
	n1 = Taptu(name1, X1, n1);
	n2 = Taptu(name2, X2, n2);
	for(int i=1; i<=n1; i++) {
		int k = Search(X2,n2, X1[i].tu);
		if(k<=n2) {
			n3++; X3[n3].tu = X1[i].tu;
			X3[n3].solan = X1[i].solan + X2[k].solan;
		}
	}
	Result(X3,n3);
}
int main(void) {
	char name1[] = "DATA1.IN";
	char name2[] = "DATA2.IN";
	Instersection(name1, name2);	
}
