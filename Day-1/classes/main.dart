class Person {
  //Members
  String name;
  int age;
  //Constructor
  Person(this.name, this.age);

  //GETTERS
  String get myName => this.name;

  String myName1() {
    return this.name;
  }

  //SETTERS
  set newName(String newName) {
    this.name = newName;
  }

  //Methods
  void describeMe() {
    print("${this.name} and ${this.age}");
  }
}

class Address extends Person {
  String address;
  Address(String name, int age, this.address) : super(name, age);

  @override
  void describeMe() {
    print("${this.name} and ${this.age}");
    super.describeMe();
  }

  void describeMyAddress() {
    print("${this.name} and ${this.age} and ${this.address}");
  }
}

void main() {
  Person person = Person("Harish", 20);
  person.describeMe();
  print(person.myName);
  person.newName = "Harry";
  print(person.myName);

  Address address = Address("Harry", 20, "NY");
  address.describeMyAddress();
}
