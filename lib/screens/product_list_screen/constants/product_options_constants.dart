import 'package:firebase_testv2/models/product.dart';

List<Map<String, dynamic>> productOrderingOptions = [
  {
    'label': 'dateAdd ASC',
    'order': (Product a, Product b) {
      return a.dateUpd.compareTo(b.dateUpd);
    },
    'id': 1,
  },
  {
    'label': 'dateAdd DESC',
    'order': (Product a, Product b) {
      return -a.dateUpd.compareTo(b.dateUpd);
    },
    'id': 2,
  },
];

List<Map<String, dynamic>> productFilteringOptions = [
  {
    'label': 'ALMACEN VIL',
    'filter': (Product product) {
      return product.warehouse == 'VIL';
    },
    'id': 1,
  },
  {
    'label': 'ALMACEN BOL',
    'filter': (Product product) {
      return product.warehouse == 'BOL';
    },
    'id': 2,
  }
];

List<Map<String, dynamic>> productViewsOptions = [
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
