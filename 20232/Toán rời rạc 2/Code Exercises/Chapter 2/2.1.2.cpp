#include<bits/stdc++.h>

using namespace std;

void printAdjMatrix(int a[100][100], int n){
	cout << "\nAdjacency Matrix:\n";
	for(int i = 0; i < n; i++){
		for(int j = 0; j < n; j++) cout << a[i][j] << " ";
		cout << "\n";
	}
}

void printEdgeList(vector<vector<int>> a, int n){
	cout << "\nEdge List:\n";
	for(int i = 0; i < n; i++){
		for(int j = 1; j < a[i].size(); j++){
			if(i + 1 < a[i][j]) cout << i + 1 << " " << a[i][j] << "\n";
		}	
	}
}
	
void AL_to_AM(vector<vector<int>> a, int n){
	int AdjMatrix[100][100];
	for(int i = 0; i < n; i++){
		for(int j = 0; j < n; j++) AdjMatrix[i][j] = 0;
	}
	
	for(int i = 0; i < n; i++){
		for(int j = 1; j < a[i].size(); j++) AdjMatrix[i][a[i][j] - 1]++;	
	}
	
	printAdjMatrix(AdjMatrix, m);
}

int main(){
	cout << "The first line stores the number of vertices.\nNext N lines store adjacency lists of vertices as follows:\nThe first number is the ending position of the segment, other numbers are list of vertices of the linked list.\nNumbers are separated by one or more spaces.\n\n";
	int n;
	cin >> n;
	vector<vector<int>> a;
	cin.ignore();
	
	for(int i = 0; i < n; i++){
		vector<int> temp;
		
		string inputLine;
		getline(cin, inputLine);
		
		istringstream iss(inputLine);
		int number;
		
		while(iss >> number) temp.push_back(number);
		
		a.push_back(temp);
	}
	
	AL_to_AM(a, n);
	printEdgeList(a, n);
}