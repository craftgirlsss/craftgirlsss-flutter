import 'package:craftgirlsss/src/helpers/formatlength/formatlength.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Container kRatings({String? value}) {
  return Container(
    padding: const EdgeInsets.all(5),
    width: 50,
    height: 16,
    decoration: BoxDecoration(
      color: Colors.amber.shade100,
    ),
    child: Row(
      children: [
        Icon(Icons.star, color: Colors.amber.shade700),
        const SizedBox(
          width: 2,
        ),
        Text(
          value ?? '0',
          style: titleInter(color: Colors.black, fontSize: 12),
        )
      ],
    ),
  );
}

Container ratingRow(context,
    {double? rating,
    Function()? onTapFavofite,
    Function()? onTapShare,
    int? soldCount}) {
  return Container(
    padding: const EdgeInsets.all(6),
    width: MediaQuery.of(context).size.width,
    height: 50,
    decoration: const BoxDecoration(color: Colors.white),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              kRratingStar(rating: rating),
              const SizedBox(width: 5),
              Text(
                rating != null ? rating.toString() : 0.toString(),
                style: titleInter(color: Colors.black, fontSize: 12),
              ),
              const VerticalDivider(
                indent: 10,
                endIndent: 10,
                width: 13,
                thickness: 1,
                color: Colors.black,
              ),
              Text(
                formatNumber(soldCount ?? 0),
                style: titleInter(color: Colors.black, fontSize: 12),
              ),
              Text(
                ' Terjual',
                style: titleInter(color: Colors.black, fontSize: 12),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: onTapFavofite,
                icon: const Icon(Icons.favorite_border, size: 19),
                tooltip: 'Tambah ke favorut',
              ),
              IconButton(
                  onPressed: onTapShare,
                  icon: const Icon(Icons.share_outlined, size: 19))
            ],
          ),
        )
      ],
    ),
  );
}

ListTile kTileUlasan(context, {double? rating, Function()? onPressed}) {
  return ListTile(
    tileColor: Colors.white,
    onTap: onPressed,
    title: Text(
      "Penilaian produk",
      style: titleInter(
          color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
    ),
    subtitle: Row(
      children: [
        kRratingStar(rating: rating),
        const SizedBox(width: 5),
        Text(
          rating != null ? rating.toString() : 0.toString(),
          style: titleInter(color: Colors.black, fontSize: 12),
        ),
      ],
    ),
    trailing: TextButton(
        onPressed: onPressed,
        child: Text(
          'Lihat ulasan',
          style: titleInter(color: Colors.blue, fontSize: 12),
        )),
  );
}

Widget kRratingStar({double? rating}) {
  return RatingBarIndicator(
    rating: rating ?? 0,
    itemBuilder: (context, index) => const Icon(
      Icons.star,
      color: Colors.amber,
    ),
    itemCount: 5,
    itemSize: 18,
    direction: Axis.horizontal,
  );
}
