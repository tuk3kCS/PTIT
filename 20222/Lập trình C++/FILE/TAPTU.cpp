#include <iostream>
#include <fstream>
#define MAX 100000
using namespace std;
struct WORD {
	string tu;//dinh nghia mot tu
	int solan;//so lan xuat hien tu trong file
};
//tim s trong tap tu X[]
int Search(WORD X[], int n, string s) {	
	for(int i=1; i<=n; i++) {
		if(X[i].tu==s) return i;
	}
	return n+1;
}
//Dua ra tap tu
void Result(WORD X[], int n){
	ofstream fp("ketqua.out");//tao file ketqua.out de ghi
	cout<<"So tu:"<<n<<endl;//dua ra man hinh n
	fp<<n<<endl;//ghi vao file ketqua.out
	for(int i=1; i<=n; i++) {//duyet tren tap tu
		cout<<X[i].tu<<"  "<<X[i].solan<<endl;//dua ra man hình
		fp<<X[i].tu<<"  "<<X[i].solan<<endl;//ghi trong file ketqua.out
	}
	fp.close();//dong file
}
//tim tap tu va so lan xuat hien moi tu
int Taptu(char *name){
	ifstream fp(name);	//dinh nghia con tro file de doc
	WORD X[MAX];//dinh nghia tap tu
	int n=0;//so luong tap tu 
	string s;//dinh nghia xau s
	while(!fp.eof()) { //lap cho den cuoi file
		fp>>s;	//doc mot tu
		int k = Search(X, n, s);//tim tu trong tap X[]
		if(k<=n) { //neu tu da co trong X[]
			X[k].solan ++; //tang so lan xuat hien len 1
		}
		else { //neu tu s chua co mat trong X[]
			n = k;//tang so tu
			X[k].tu = s; //thiet lap tu moi s vao X[]
			X[k].solan = 1;//so lan xuat hien tu moi la 1
			
		}
	}
	Result(X,n); //dua ra ket qua
	fp.close();//dong file
	return n;//tra lai so luong tu
}
int main(void) {
	char name[] = "DATA1.IN";
	Taptu(name);
}
