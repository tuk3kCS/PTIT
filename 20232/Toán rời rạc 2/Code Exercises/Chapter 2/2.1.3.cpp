#include<bits/stdc++.h>

using namespace std;

void printAdjMatrix(int a[100][100], int n){
	cout << "\nAdjacency Matrix:\n";
	for(int i = 0; i < n; i++){
		for(int j = 0; j < n; j++) cout << a[i][j] << " ";
		cout << "\n";
	}
}

void printAdjList(vector<vector<int>> AdjList, int m){
	cout << "\nAdjacency List:\n";
	for(int i = 1; i <= m; i++){
		cout << "Adj(" << i << "): {";
		for(int j = 0; j < AdjList[i].size(); j++){
			if(j == AdjList[i].size() - 1){
				cout << AdjList[i][j] << "}\n";
				break;
			}
			else cout << AdjList[i][j] << ", ";
		}
	}
}

void EL_to_AM(vector<vector<int>> a, int m, int n){
	int AdjMatrix[100][100];
	for(int i = 0; i < m; i++){
		for(int j = 0; j < m; j++) AdjMatrix[i][j] = 0;
	}
	
	for(int i = 0; i < n; i++){
		AdjMatrix[a[i][0] - 1][a[i][1] - 1] = a[i][2];
	}
	
	printAdjMatrix(AdjMatrix, m);
}

vector<vector<int>> EL_to_AL(vector<vector<int>> a, int m, int n){
	vector<vector<int>> adjList(n);
	for(int i = 0; i <= m; i++){
		vector<int> temp;
		adjList.push_back(temp);
	}
	
	for(int i = 0; i < n; i++){
		adjList[a[i][0]].push_back(a[i][1]);
	}
	
	return adjList;
}

int main(){
	cout << "The first line stores m, n, the number of vertices and the number of edges of the graph.\nIn the next n lines, each line stores an edge of the graph.\n\n";
	int m, n;
	cin >> m >> n;
	cin.ignore();
	
	vector<vector<int>> a;
	for(int i = 0; i < n; i++){
		vector<int> temp;
		
		string inputLine;
		getline(cin, inputLine);
		
		istringstream iss(inputLine);
		int number;
		
		while(iss >> number) temp.push_back(number);
		
		a.push_back(temp);
	}
	
	EL_to_AM(a, m, n);
	
	vector<vector<int>> AdjList = EL_to_AL(a, m, n);
	printAdjList(AdjList, m);
}