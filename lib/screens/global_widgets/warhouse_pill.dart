import 'package:flutter/material.dart';

class CustomWarehousePill extends StatelessWidget {
  const CustomWarehousePill({Key? key, required this.warehouseName})
      : super(key: key);
  final String warehouseName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: const Color(0xff3e9a41),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      child: Text(
        warehouseName,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 12,
          letterSpacing: 0.25,
        ),
      ),
    );
  }
}
