part of 'product_edit_cubit.dart';

class ProductEditState {
  late Palet? currentPalet;
  late Reference? currentReference;
  final List<Palet> palets = [
    new Palet(id: 1, name: 'Palet EUR (1200 x 800)'),
    new Palet(id: 2, name: 'Palet EUR6 (800 x 600)'),
    new Palet(id: 3, name: 'Palet Americano (1000 x 1200)'),
  ];
  final List<Reference> references = [
    new Reference(id: 1, name: 'Monoreferencia'),
    new Reference(id: 2, name: 'Más de una referencia'),
  ];
  ProductEditState({
    this.currentPalet,
    this.currentReference,
  });

  ProductEditState copyWith({
    Palet? currentPalet,
    Reference? currentReference,
  }) {
    return ProductEditState(
      currentPalet: currentPalet ?? this.currentPalet,
      currentReference: currentReference ?? this.currentReference,
    );
  }
}
