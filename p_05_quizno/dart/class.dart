void main(){
  // Animal animal1 = Animal();
  // int num = animal1.age;
  // String str = animal1.name;
  // print(num);
  // print(str);
  // animal1.move();

  Animal2 anim = Animal2('ali', 10);
  print(anim.name);
  print(anim.age);

  anim.move();
  print(anim.giveAge());
}


class Animal {
  // properties, attributes, fields
  String name = 'puppy';
  int age = 5;

  // functions (methods)
  void move() {
    print('moving...');
    print('$name is moving...');
  }
}

class Animal2 {
  String name;
  int age = 4;

  // constructors
  Animal2(this.name, this.age);

  void move() {
    print('moving...');
    print('$name is moving...');
  }

  int giveAge(){
    return age;
  }
}


