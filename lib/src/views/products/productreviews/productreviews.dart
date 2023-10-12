import 'package:craftgirlsss/src/view-models/appbars/appbar.dart';
import 'package:craftgirlsss/src/view-models/reviews/productreview.dart';
import 'package:flutter/material.dart';

class PrductReviews extends StatelessWidget {
  const PrductReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: defaultAppBar(title: "Semua Ulasan", autoImplyLeading: true),
      body: ListView.separated(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemBuilder: (context, index) => productReview(
                context,
                commentatorName: "Regard",
                imageURLDescription: [
                  'https://googleflutter.com/sample_image.jpg'
                ],
                reasons:
                    'dhkjhdfshfuiwehfesihfjcksfhewhfnckcdshiuerfdghjagdkasbdafkajsbdkasbdbaskjfbkasbdkaguadkjcakbdiwedjkbcksb',
                starCount: 3,
              ),
          separatorBuilder: (context, index) => const SizedBox(height: 3),
          itemCount: 2),
    );
  }
}
