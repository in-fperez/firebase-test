class Task {
  String id;
  DateTime dateAdd;
  String name;
  String warehouse;
  String? warning;
  Task({
    required this.id,
    required this.dateAdd,
    required this.name,
    required this.warehouse,
    this.warning,
  });

  factory Task.fromFirebaseMap(String id, dynamic map) {
    return Task(
      id: id,
      dateAdd: DateTime.parse(map['dateAdd']),
      name: map['name'],
      warehouse: map['warehouse'],
      warning: 'asdflkjsf',
    );
  }
}
