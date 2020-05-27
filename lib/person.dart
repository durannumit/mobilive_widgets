class Person {
  // variables
  String id;
  String name;
  int age;

  // constructor
  Person({
    this.id,
    this.age,
    this.name,
  });

  Person.fromMap(Map snapshot, String id)
      : id = id ?? '',
        name = snapshot['name'] ?? '',
        age = snapshot['age'] ?? '';

  toJson() {
    return {
      "name": name,
      "age": age,
    };
  }
}
