import 'package:craftgirlsss/src/view-models/buttons/elevatedbuttons.dart';
import 'package:flutter/material.dart';

Widget containerDiscount(context,
    {String? urlImage = '', Function()? onPressed}) {
  return Stack(
    children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2.5,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (context, index) => Image.network(
            urlImage!,
            errorBuilder: (context, error, stackTrace) => const Text('error'),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 100, right: 100),
        child: Center(
          child: Positioned(
              bottom: 10,
              child: kButtons(context,
                  label: "Beli sekarang", fonSize: 17, onPressed: () {})),
        ),
      )
    ],
  );
}
