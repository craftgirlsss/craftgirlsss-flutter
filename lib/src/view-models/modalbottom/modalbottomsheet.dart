import 'package:flutter/material.dart';

showProductSpecification(context) {
  return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.5,
          child: Column(
            children: [
              const SizedBox(height: 15),
              Container(
                color: Colors.grey.shade200,
                child: Container(
                  width: 60,
                  height: 8,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(20.0),
                child: Table(
                  children: const [
                    TableRow(children: [
                      Text('Stok'),
                      Text('31'),
                    ]),
                    TableRow(children: [
                      Text('Ukuran'),
                      Text('XL, L, XXL, M'),
                    ]),
                    TableRow(children: [
                      Text('Merek'),
                      Text('Cardinal'),
                    ])
                  ],
                ),
              )
            ],
          ),
        );
      });
}
