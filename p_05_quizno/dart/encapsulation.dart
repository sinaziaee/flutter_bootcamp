class Bird {
  String _name = 'tooti';
  String voice;
  int _age = 10;

  Bird(this.voice);

  void fly() {
    print("The bird can fly");
  }

  // int get age => _age;

  int get age {
    return _age * 10;
  }

  void set age(int value) {
    if (value > 10) {
      _age = value;
    }
    else{
      // pass
    }
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

// getters & setters

}

class Parrot extends Bird {
  int age;

  Parrot(String name, this.age, String voice) : super(voice);

  void speak() {
    print("The parrot can speak");
  }
}

void main() {
  Bird b = Bird('knock knock');
  Parrot p = Parrot('sina', 2, 'ghar ghar');
  print(p.age);
  p.age = 10;
  print(p.age);
}
