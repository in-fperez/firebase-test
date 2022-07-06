part of 'context_cubit.dart';

class ContextState {
  late User? user;
  late Vertical? currentVertical;
  late Warehouse? currentWarehouse;
  late bool darkMode;
  final List<Warehouse> warehouses = [
    new Warehouse(id: 1, name: 'VIL'),
    new Warehouse(id: 2, name: 'BEN'),
  ];
  final List<Vertical> verticals = [
    new Vertical(id: 4, name: 'SKL'),
    new Vertical(id: 6, name: 'IKH'),
    new Vertical(id: 9, name: 'SMB'),
  ];
  ContextState(
      {this.user,
      this.currentVertical,
      this.currentWarehouse,
      this.darkMode = true});

  ContextState copyWith({
    User? user,
    Vertical? currentVertical,
    Warehouse? currentWarehouse,
    bool? darkMode,
  }) {
    return ContextState(
      user: user ?? this.user,
      currentVertical: currentVertical ?? this.currentVertical,
      currentWarehouse: currentWarehouse ?? this.currentWarehouse,
      darkMode: darkMode ?? this.darkMode,
    );
  }
}
