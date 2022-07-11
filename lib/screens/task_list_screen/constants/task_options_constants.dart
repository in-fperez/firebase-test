import 'package:firebase_testv2/models/task.dart';

List<Map<String, dynamic>> taskOrderingOptions = [
  {
    'label': 'Más antiguas',
    'order': (Task a, Task b) {
      return a.dateAdd.compareTo(b.dateAdd);
    },
    'id': 1,
  },
  {
    'label': 'Más recientes',
    'order': (Task a, Task b) {
      return -a.dateAdd.compareTo(b.dateAdd);
    },
    'id': 2,
  },
];

List<Map<String, dynamic>> taskFilteringOptions = [
  {
    'label': 'ALMACEN VIL',
    'filter': (Task task) {
      return task.warehouse == 'VIL';
    },
    'id': 1,
  },
  {
    'label': 'ALMACEN BOL',
    'filter': (Task task) {
      return task.warehouse == 'BOL';
    },
    'id': 2,
  }
];

List<Map<String, dynamic>> taskViewsOptions = [
  {
    'label': 'Large',
    'id': 1,
  },
  {
    'label': 'Medium',
    'id': 2,
  },
  {
    'label': 'Small',
    'id': 3,
  }
];
