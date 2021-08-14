class Car{
  void driving(){
    print("driving car 1");
  }
}

class Honda extends Car{
  //override method overrides generic driving method
  @override
  void driving(){
    super.driving(); //calls generic driving method
    print("driving car 2");
  }
}

void main(){
  Honda honda =  new Honda();
  honda.driving();
}
