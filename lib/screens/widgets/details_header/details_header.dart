import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_testv2/constants/constants.dart';
import 'package:firebase_testv2/models/product.dart';
import 'package:firebase_testv2/models/task.dart';

class DetailsHeaderWidget extends StatelessWidget {
  final Product? product;
  final Task? task;
  const DetailsHeaderWidget({Key? key, this.product, this.task})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? name = this.product != null ? this.product?.name : this.task?.name;
    String? warehouse =
        this.product != null ? this.product?.warehouse : this.task?.warehouse;
    return Row(
      children: [
        const Expanded(
          flex: 1,
          child: Image(
            image: AssetImage('images/lixchair.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 7),
                  child: Text(
                    name.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 16, bottom: 7),
                  child: Text(
                    "Color roja patas metalizadas",
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(17, 0, 0, 8),
                    child: Chip(
                      backgroundColor: ColorConstants.accentColor,
                      label: Text(warehouse.toString()),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.local_print_shop_outlined,
                          color: ColorConstants.accentColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.star_border_outlined,
                          color: ColorConstants.accentColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.crop_free_rounded,
                          color: ColorConstants.accentColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.more_vert,
                          color: ColorConstants.accentColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
