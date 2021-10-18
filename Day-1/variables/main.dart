void main() {
  //but same type
  var var_can_change = 55;
  var_can_change = 100;
  print(var_can_change);

  //dynamic can be any type
  dynamic dynamic_any_type = 5;
  dynamic_any_type = "I am a string now";
  print(dynamic_any_type);

  //const must be remain same and installized at compile time cannot be reassigned

  const give_value_now = "Harry";

  final final_cannot_reassigned;
  final_cannot_reassigned = "Harry";

  //BASIC TYPES
  //INT
  //STRING
  //DOUBLE
  //BOOL

  int price = 100;

  double total = 100.000;

  String name = "Harish Vadaparty";

  bool isTall = true;

  //LIST

  List subjects = [500, "Hii", true, 100.0];
  print(subjects.runtimeType);

  List<String> stringList = ["Hii", "Only String"];

  print(subjects[0]);

  //SET ()No duplicates()
  Set colors = {"Blue", "Red", "Green"};

  Set<String> setString = {"Blue", "Red", "Green"};

  //Maps (Dictonary)
  Map timeTable = {
    "subject": "Physics",
    "marks": [
      {"total": 100, "obtained": 60},
      {"total": 100, "obtained": 60}
    ]
  };

  Map<String, dynamic> StringtimeTable = {
    "subject": "Physics",
    "marks": [
      {"total": 100, "obtained": 60},
      {"total": 100, "obtained": 60}
    ]
  };

  print(timeTable);
  print(timeTable['subject']);
  print(timeTable['subject']);
  print(timeTable['teacher']);
  print(timeTable.keys);
}
