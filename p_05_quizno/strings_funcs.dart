void main(){
  String str = ' salam doostan';
  print(str);
  str = str + ' khoobin ? ';
  print(str);
  print(str.length);
  print(str.lastIndexOf('s'));
  str = str.replaceAll('sa', 'f');
  print(str);
  print(str.contains('doof'));
  print(str.endsWith('in?'));
  // str = '01-02-03';
  List list = str.split(' ');
  print(list);
  // str = '12345';
  print(str.toUpperCase());
  print(str.trimLeft());

}
