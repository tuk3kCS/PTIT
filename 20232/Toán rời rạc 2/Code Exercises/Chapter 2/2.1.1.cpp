#include<bits/stdc++.h>
using namespace std;

vector<vector<int>> AM_to_AL(int a[100][100], int n){
	
	vector<vector<int>> adjList(n);
	for(int i = 0; i < n; i++){
		for(int j = 0; j < n; j++){
			if(a[i][j] != 0) adjList[i].push_back(j);
		}
	}
	return adjList;
}
	
void printAdjList(vector<vector<int>> AdjList){
	cout << "\nAdjacency List:\n";
	for(int i = 1; i <= AdjList.size(); i++){
		cout << "Adj(" << i + 1 << "): {";
		for(int j = 0; j < AdjList[i].size(); j++){
			if(j == AdjList[i].size() - 1){
				cout << AdjList[i][j] + 1 << "}\n";
				break;
			}
			else cout << AdjList[i][j] + 1 << ", ";
		}
	}
}

void printEdgeList(int a[100][100], int n){
	cout << "\nEdge List:\n";
	for(int i = 0; i < n; i++){
		for(int j = 0; j < n; j++){
			if(a[i][j] != 0 && i < j) cout << i + 1 << " " << j + 1 << "\n";
		}
	}
}
	
int main(){
	cout << "The first line is the number of vertices.\nThe next n lines store the adjacency matrix.\nTwo elements are separated by one or more spaces.\n\n";
	int n;
	cin >> n;
	
	int a[100][100];
	for(int i = 0; i < n; i++){
		for(int j = 0; j < n; j++) cin >> a[i][j];
	}

	vector<vector<int>> AdjList = AM_to_AL(a, n);
	
	printAdjList(AdjList);
	printEdgeList(a, m);
}