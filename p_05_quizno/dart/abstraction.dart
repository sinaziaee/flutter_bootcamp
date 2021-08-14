abstract class Person {
//declaring abstract method

  int age = 5;
  void displayInfo(String name);  //abstract method

  void printAge(){
    print('my age is $age');
  }

}
class Boy extends Person
{
// Overriding method
  @override
  void displayInfo(String name) {
    print("My name is $name");
  }

}

class Girl extends Person
{
// Overriding method
  void displayInfo(String name) {
    print("My name is $name");

  }

}

void main() {
  Boy b = new Boy();  // Creating Object of Boy class
  Girl g = new Girl();  // Creating Object of Girl class

  b.displayInfo('Sina');
  g.displayInfo('Mina');
  b.printAge();

}