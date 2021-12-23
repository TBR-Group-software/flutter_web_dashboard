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
