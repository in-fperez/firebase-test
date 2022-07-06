import 'package:firebase_testv2/models/vertical.dart';
import 'package:firebase_testv2/models/warehouse.dart';

class User {
  final String id;
  final String email;
  final List<int> allowedVerticals;
  final List<int> allowedWarehouses;
  final Map<String, bool> allowedRoutes;
  final String token;
  final String firebaseToken;
  User({
    required this.id,
    required this.email,
    required this.token,
    required this.firebaseToken,
    required this.allowedVerticals,
    required this.allowedWarehouses,
    required this.allowedRoutes,
  });

  factory User.fromJson(
    Map<String, dynamic> session,
    String token,
    String firebaseToken,
  ) {
    Map<String, dynamic> attributes = session["attributes"];
    Map<String, dynamic> permissions = session["permissions"];
    List<dynamic> fetchedAllowedVerticals =
        attributes.containsKey('allowedVerticals')
            ? attributes['allowedVerticals']
            : [];
    List<dynamic> fetchedAllowedWarehouses =
        attributes.containsKey('allowedWarehouses')
            ? attributes['allowedWarehouses']
            : [];
    Map<String, dynamic> fetchedAllowedRoutes =
        permissions.containsKey('route') ? permissions['route'] : {};
    List<int> allowedVerticals = [];
    List<int> allowedWarehouses = [];
    Map<String, bool> allowedRoutes = {};
    for (dynamic verticalId in fetchedAllowedVerticals) {
      allowedVerticals.add(verticalId as int);
    }
    for (dynamic warehouseId in fetchedAllowedWarehouses) {
      allowedWarehouses.add(warehouseId as int);
    }
    for (MapEntry<String, dynamic> entry in fetchedAllowedRoutes.entries) {
      print('route /${entry.key}');
      allowedRoutes['/${entry.key}'] = entry.value as bool;
    }
    return User(
      id: session['id'],
      email: session['id'],
      allowedVerticals: allowedVerticals,
      allowedWarehouses: allowedWarehouses,
      allowedRoutes: allowedRoutes,
      token: token,
      firebaseToken: firebaseToken,
    );
  }
}
