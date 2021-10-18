void main() {
  int age = 20;
  bool isTall = true;
  drivingLicense(age);

  Map datatimeTable = {
    "subject": "Physics",
    "marks": [
      {"total": 100, "obtained": 60},
      {"total": 100, "obtained": 60}
    ]
  };

  for (var i = 0; i < 100; i++) {
    if (i > 5) continue;
    print(i);

    print("$i \n");
  }

  while (isTall) {
    print('Hii');
    isTall = false;
  }

  datatimeTable.forEach((key, value) {
    print("$key $value");
  });
}

void drivingLicense(int age) {
  if (age > 18) {
    print("You can drive");
  } else {
    print("You canr drive");
  }
}
