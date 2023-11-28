import 'package:craftgirlsss/src/helpers/formatcurrency/formatcurrency.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:flutter/material.dart';

Widget cardProductV3(context,
    {Function()? onPressed,
    String? urlImage = '',
    bool? discount = false,
    String productName = '',
    int? discountPercent,
    bool? newProduct = false,
    bool? addingDescriptionUniq = false,
    String? descriptionUnique,
    double? stars = 0,
    bool? theBestProduct = false,
    bool? gratisOngkir = false,
    bool? cashbackextra = false,
    bool? productStars = false,
    Function()? onPressedButton,
    int? price,
    int? totalBought}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      width: 60,
      height: MediaQuery.of(context).size.height / 2,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 2,
                offset: const Offset(0, 1))
          ],
          borderRadius: BorderRadius.circular(3)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: Colors.transparent,
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 150,
                      width: double.infinity,
                      child: Image.asset(
                        'assets/images/example-product.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    discount == true
                        ? Container(
                          color: Colors.transparent,
                            child: Positioned(
                              top: 0,
                              right: 0,
                              child: SizedBox(
                                child: Container(
                                  width: 30,
                                  height: 18,
                                  color: Colors.amber.shade300,
                                  padding: const EdgeInsets.all(2),
                                  child: Center(
                                    child: Text(
                                      "-$discountPercent%",
                                      style: sfPro(
                                          color: Colors.orange.shade900,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Container(),
                    gratisOngkir == true
                        ? Container(
                          color: Colors.transparent,
                            child: Positioned(
                              bottom: 0,
                              left: 0,
                              child: SizedBox(
                                  child: cashbackextra == true
                                      ? Image.asset(
                                          'assets/icons/freshicons/banner-gratis-ongkir-xtra.png')
                                      : Image.asset(
                                          'assets/icons/freshicons/banner-gratis-ongkir.png')),
                            ),
                          )
                        : Container(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      theBestProduct == true
                          ? Container(
                              height: 17,
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Center(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Star",
                                        style: sfPro(
                                            fontSize: 10,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.white)),
                                    const Icon(Icons.star,
                                        color: Colors.white, size: 10)
                                  ],
                                ),
                              ),
                            )
                          : const SizedBox(height: 0, width: 0),
                      theBestProduct == true
                          ? const SizedBox(width: 5)
                          : const SizedBox(height: 0, width: 0),
                      Flexible(
                        child: Text(
                          productName,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: sfPro(fontSize: 11),
                        ),
                      )
                    ],
                  ),
                ),
                newProduct == true
                    ? Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  border: Border.all(
                                      color: Colors.red.shade700, width: 0.5),
                                  color: Colors.white),
                              child: Text(
                                'Produk Terbaru',
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                                style: sfPro(
                                    color: Colors.red.shade700, fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            Container(
                              height: 17,
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.amber.shade50,
                                borderRadius: BorderRadius.circular(2),
                                border:
                                    Border.all(color: Colors.amber.shade400),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Icon(Icons.star,
                                        color: Colors.amber.shade600, size: 12),
                                  ),
                                  Text(
                                    "4.6",
                                    style: sfPro(
                                        color: Colors.black, fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 5),
                            addingDescriptionUniq == true
                                ? Container(
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2),
                                        color: Colors.amber.shade50),
                                    child: Text(
                                      '"$descriptionUnique"',
                                      maxLines: 1,
                                      overflow: TextOverflow.clip,
                                      style: sfPro(
                                          color: Colors.amber, fontSize: 10),
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      Text(
                        formatCurrencyForCardProduct.format(price),
                        style: sfPro(fontSize: 12, color: Colors.red.shade600),
                      ),
                      const SizedBox(width: 3),
                      newProduct == false
                          ? Text(
                              "${totalBought}RB terjual",
                              style: sfPro(fontSize: 8),
                            )
                          : Container(),
                    ],
                  ),
                ),
                Flexible(
                  child: InkWell(
                    onTap: onPressedButton,
                    child: Image.asset(
                      'assets/icons/freshicons/menu-dot.png',
                      scale: 1.5,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
