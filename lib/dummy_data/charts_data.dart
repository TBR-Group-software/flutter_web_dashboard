class UsersAgeData {
  const UsersAgeData(this.age, this.percent);

  final String age;
  final double percent;
}

const List<UsersAgeData> femaleData = <UsersAgeData>[
  UsersAgeData('65+', 5.5),
  UsersAgeData('45 - 56', 5.5),
  UsersAgeData('35 - 44', 7.5),
  UsersAgeData('25 - 34', 9),
  UsersAgeData('18 - 24', 9),
];

const List<UsersAgeData> maleData = <UsersAgeData>[
  UsersAgeData('65+', 4.5),
  UsersAgeData('45 - 56', 4.9),
  UsersAgeData('35 - 44', 9),
  UsersAgeData('25 - 34', 14),
  UsersAgeData('18 - 24', 8),
];

const Map<int, List<double>> activeUsersData = <int, List<double>>{
  1: [200, 310],
  2: [305, 450],
  3: [270, 390],
  4: [210, 310],
  5: [100, 160],
  6: [300, 450],
  7: [210, 310],
  8: [150, 210],
  9: [210, 310],
  10: [210, 308],
};
