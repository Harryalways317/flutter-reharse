void main() {
  String name = "Harish";
  int phNo = 6301786793;
  Map datatimeTable = {
    "subject": "Physics",
    "marks": [
      {"total": 100, "obtained": 60},
      {"total": 100, "obtained": 60}
    ]
  };
  sayMyName(name);
  sayMyName2(name: name);
  sayMyName2(name: name, phNo: phNo);
  sayMyName3(name, phNo);
  print(timeTable(datatimeTable));
}

void sayMyName(String name) {
  print("My name is ${name}");
}

void sayMyName2({required String name, int? phNo}) {
  print("My name is ${name} , my number is $phNo");
}

void sayMyName3([String? name, int? phNo]) {
  print("My name is ${name} , my number is $phNo");
}

Map timeTable(Map data) {
  return data;
}
