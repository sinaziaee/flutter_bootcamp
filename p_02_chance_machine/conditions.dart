void main() {
  bool flag = true;

  if (flag == true) {
    print('flag = true');
  } //
  else {
    print('flag = false');
  }

  int num = 10;

  if(num < 0){
    print('number is negative');
  }
  else if(num == 0){
    print('number = 0');
  }
  else if (num < 10){
    print('number is positive and less than 10');
  }
  else{
    print('number is positive and greater than 10');
  }

  int day = 3;

  switch(day){
    case 1:
      print('sat');
      break;
    case 2:
      print('sun');
      break;
    case 3:
      print('mon');
      break;
    case 4:
      print('tues');
      break;
    default:
      print('something else');
  }

  num = -13;

  String result = (num < 0) ? 'negative' : 'positive';
  print(result);


}
