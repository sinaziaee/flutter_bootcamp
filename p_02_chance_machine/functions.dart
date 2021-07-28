void main(){
  print(func1(25, 'with input, with output'));
  func2('with input, no output');
  print(func3());
  func4();
}

// 1) input , do sth, output
String func1(int num, String str) {
  // concatination -> concat
  String str2 = ' sina';
  String result = str + num.toString();
  return result;
}

// 2) input, do sth, -
void func2(String str){
  print(str);
}

// 3) - , do sth, output
int func3(){
  int result;
  result = 4 + 6;
  return result;
}
// 4) -, do sth, -

void func4(){
  print('no input, no output');
}

