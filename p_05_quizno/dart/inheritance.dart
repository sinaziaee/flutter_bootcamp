// // single inheritance
// class Bird {
//   String name;
//   String voice;
//
//   Bird(this.name, this.voice);
//
//   void fly() {
//     print("The bird can fly");
//   }
// }
//
// // Inherits the super class
// class Parrot extends Bird {
//   int age;
//
//   Parrot(String name, this.age, String voice) : super(name, voice);
//
//   //child class function
//
//   void speak() {
//     print("The parrot can speak");
//   }
// }
//
// void main() {
//   // Creating object of the child class
//   Parrot p = Parrot('sina', 2, 'ghar ghar');
//   p.speak();
//   p.fly();
//   print(p.name);
//   print(p.voice);
//   print(p.age);
// }

// multilevel inheritance

class Bird {
  String name = 'ali';

  void fly() {
    print("The bird can fly");
  }
}

// Inherits the super class
class Parrot extends Bird {
  int age = 2;

  void speak() {
    print("The parrot can speak");
  }
}

// Inherits the Parrot base class
class Eagle extends Parrot {
  void vision() {
    print("The eagle has a sharp vision");
  }
}

void main() {
  // Creating object of the child class
  Eagle e = Eagle();
  e.speak();
  e.fly();
  e.vision();
  print(e.age);
  print(e.name);
}

// inheritance, abstraction, encapsulation, polymorphism