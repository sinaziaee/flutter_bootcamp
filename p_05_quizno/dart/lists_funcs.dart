void main(){
  List list = [1, 2, 3, 4, 5, 'salam', 'ali', true, false, 1.06, .67];
  List<int> numList = [53, 213, 61, 432, 87, 51];

  listInfoPrinter(list);
  print('reversed list: ${list.reversed}');
  // list = list.reversed.toList();
  print(list.first);
  print(list.last);
  print(list.isEmpty);
  print(list.isNotEmpty);
  list.add('hossein');
  listInfoPrinter(list);
  list.remove('ali2');
  listInfoPrinter(list);
  list.removeLast();
  listInfoPrinter(list);
  list.removeAt(1);
  listInfoPrinter(list);
  print(list.toString());
  String result = list.toString();
  // list.clear();
  // listInfoPrinter(list);
  list.insert(2, true);
  listInfoPrinter(list);
  list[2] = 'memari';
  listInfoPrinter(list);
  print(list.indexOf('salam2'));
}

void listInfoPrinter(List list){
  print(list);
  print('size: ${list.length}');
}