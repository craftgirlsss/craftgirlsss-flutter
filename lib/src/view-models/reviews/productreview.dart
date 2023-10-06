import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:craftgirlsss/src/view-models/ratingsstatus/ratingproductstatus.dart';
import 'package:flutter/material.dart';

Container productReview(context,
    {String? urlImageProfile,
    String? commentatorName,
    double? starCount,
    String? reasons,
    Function()? onPressedViewImage,
    List? imageURLDescription}) {
  return Container(
    padding: const EdgeInsets.all(10),
    color: Colors.white,
    width: MediaQuery.of(context).size.width,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 0),
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: urlImageProfile != null
                    ? NetworkImage(urlImageProfile)
                    : const NetworkImage(
                        'https://googleflutter.com/sample_image.jpg'),
                fit: BoxFit.fitWidth),
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                commentatorName ?? 'Unknown',
                style: titleInter(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
              const SizedBox(height: 5),
              kRratingStar(rating: starCount ?? 0),
              const SizedBox(height: 5),
              Text(reasons ?? '-',
                  overflow: TextOverflow.clip,
                  style: titleInter(
                      color: Colors.black54,
                      fontWeight: FontWeight.normal,
                      fontSize: 12)),
              imageURLDescription != null
                  ? Center(
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Lihat gambar',
                            style: titleInter(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          )),
                    )
                  : const SizedBox(
                      height: 0,
                      width: 0,
                    )
            ],
          ),
        ),
      ],
    ),
  );
}
