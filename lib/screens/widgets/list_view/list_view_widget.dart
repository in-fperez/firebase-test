import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  final List<dynamic> items;
  final Function cardBuilder;
  const ListViewWidget({
    Key? key,
    required this.items,
    required this.cardBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (this.items.isEmpty) return Container();
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return cardBuilder(this.items[index]);
      },
    );
  }
}
