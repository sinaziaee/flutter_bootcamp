void main() {
  // 1, 1, 2, 3, 5, 8 , 13, 21, 34, 55, ...
  // fibonatchi

  print(fibonatchi(6));

  List<int> numList = [5, 6, 1, 7, 71, 12, 61, 634, 431];
  // bubble sort, merge sort, insertion, quick sort, ...
  print(numList);
  sort(numList);
}

int fibonatchi(int num) {
  if (num == 1 || num == 2) {
    return 1;
  } //
  else {
    return fibonatchi(num - 1) + fibonatchi(num - 2);
  }
}

void sort(List list) {
  // bubble sort O(n^2)
  int size = list.length;
  for (int i = 0; i < size; i++) {
    for (int j = 0; j < size; j++) {
      if(list[j] > list[i]){
        // switch
        int temp = list[j];
        list[j] = list[i];
        list[i] = temp;
      }
    }
  }
  print(list);
}
