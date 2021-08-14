class Bird {
  String name;
  String voice;

  Bird(this.name, this.voice);

  void fly() {
    print("The bird can fly");
  }
}

class Parrot extends Bird {
  int age;

  Parrot(String name, this.age, String voice) : super(name, voice);

  void speak() {
    print("The parrot can speak");
  }

  @override
  void fly(){
    print("The parrot can fly with age $age");
  }

}

void main() {
  Bird b = Bird('ali', 'knock knock');
  Parrot p = Parrot('sina', 2, 'ghar ghar');
  b.fly();
  p.fly();
}
