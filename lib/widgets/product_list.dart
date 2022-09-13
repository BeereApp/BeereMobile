import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  final int selected;
  final Function callback;
  const ProductList({Key? key, required this.selected, required this.callback, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('List'),
    );
  }
}



