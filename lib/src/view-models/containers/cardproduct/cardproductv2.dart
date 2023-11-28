import 'package:craftgirlsss/src/helpers/formatcurrency/formatcurrency.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

Widget cardProductV2(context,
    {int? index,
    String? productName,
    int? productPrice,
    double? ratings,
    String? urlImage,
    Function()? onPressed,
    Function()? onFavorite,
    Function()? onAdd}) {
  return InkWell(
    onTap: onPressed,
    onLongPress: () {
      HapticFeedback.mediumImpact();
      Get.defaultDialog(
          radius: 7,
          titlePadding: const EdgeInsets.all(8),
          contentPadding: const EdgeInsets.all(8),
          title: productName ?? '-',
          content:
              Image.asset(urlImage ?? 'assets/images/no-available-image.png'));
    },
    child: AnimationConfiguration.staggeredList(
      position: index ?? 0,
      delay: const Duration(milliseconds: 100),
      child: SlideAnimation(
        duration: const Duration(milliseconds: 2500),
        curve: Curves.fastLinearToSlowEaseIn,
        horizontalOffset: 30,
        verticalOffset: 300.0,
        child: FlipAnimation(
          duration: const Duration(milliseconds: 3000),
          curve: Curves.fastLinearToSlowEaseIn,
          flipAxis: FlipAxis.y,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5.5,
            padding:
                const EdgeInsets.only(left: 13, right: 13, top: 13, bottom: 13),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.black.withOpacity(0.2),
              //     blurRadius: 25,
              //     spreadRadius: 10,
              //   ),
              // ],
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                image: AssetImage(urlImage ??
                                    'assets/images/no-available-image.png'),
                                fit: BoxFit.cover,
                                onError: (exception, stackTrace) =>
                                    const Text('error'),
                              )),
                        ),
                        const SizedBox(width: 12),
                        Flexible(
                          child: Container(
                            color: Colors.transparent,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  productName ?? '-',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: sfPro(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  formatCurrency.format(150000),
                                  style: sfPro(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                const SizedBox(height: 5),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 2, vertical: 2),
                                  width: 45,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.green.shade700,
                                      borderRadius: BorderRadius.circular(3)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.star_border,
                                          color: Colors.white, size: 16),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                        ratings != null
                                            ? ratings.toString()
                                            : '3.5',
                                        style: sfPro(
                                            color: Colors.white, fontSize: 12),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: onFavorite,
                        child: Icon(Icons.favorite_border,
                            size: 19, color: Colors.green.shade700),
                      ),
                      GestureDetector(
                        onTap: onAdd,
                        child: Icon(Icons.add,
                            size: 19, color: Colors.green.shade700),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

@immutable
class CardProductForMyCart extends StatefulWidget {
  final String? productName, urlImage, ukuran, warna;
  final Function()? onPressed;
  final int? index, productPrice;
  const CardProductForMyCart(
      {super.key,
      this.productName,
      this.onPressed,
      this.urlImage,
      this.index,
      this.ukuran,
      this.warna,
      this.productPrice});

  @override
  State<CardProductForMyCart> createState() => _CardProductForMyCartState();
}

class _CardProductForMyCartState extends State<CardProductForMyCart> {
  int _itemCount = 0;
  int totalPriceNow = 0;
  int price = 0;
  @override
  void initState() {
    super.initState();
    price = widget.productPrice!;
    totalPriceNow = widget.productPrice!;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      onLongPress: () {
        HapticFeedback.mediumImpact();
        Get.defaultDialog(
            radius: 7,
            titlePadding: const EdgeInsets.all(8),
            contentPadding: const EdgeInsets.all(8),
            title: widget.productName ?? '-',
            content: Image.asset(
                widget.urlImage ?? 'assets/images/no-available-image.png'));
      },
      child: AnimationConfiguration.staggeredList(
        position: widget.index ?? 0,
        delay: const Duration(milliseconds: 100),
        child: SlideAnimation(
          duration: const Duration(milliseconds: 2500),
          curve: Curves.fastLinearToSlowEaseIn,
          horizontalOffset: 30,
          verticalOffset: 300.0,
          child: FlipAnimation(
            duration: const Duration(milliseconds: 3000),
            curve: Curves.fastLinearToSlowEaseIn,
            flipAxis: FlipAxis.y,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 5.5,
              padding: const EdgeInsets.only(
                  left: 13, right: 13, top: 13, bottom: 13),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                image: DecorationImage(
                                  image: AssetImage(widget.urlImage ??
                                      'assets/images/no-available-image.png'),
                                  fit: BoxFit.cover,
                                  onError: (exception, stackTrace) =>
                                      const Text('error'),
                                )),
                          ),
                          const SizedBox(width: 12),
                          Flexible(
                            child: Container(
                              color: Colors.transparent,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.productName ?? '-',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: sfPro(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    formatCurrency.format(totalPriceNow),
                                    style: sfPro(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                          'Ukuran : ${widget.ukuran != null ? widget.ukuran?.toUpperCase() : "-"}',
                                          style: sfPro(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 12)),
                                      const SizedBox(width: 5),
                                      Text(
                                        'Warna : ${widget.warna ?? "-"}',
                                        style: sfPro(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 2,
                                  spreadRadius: 2,
                                ),
                              ],
                              color: Colors.white),
                          child: Row(
                            children: [
                              InkWell(
                                  onTap: _itemCount != 0
                                      ? () {
                                          setState(() {
                                            _itemCount--;
                                            totalPriceNow =
                                                totalPriceNow - price;
                                          });
                                        }
                                      : null,
                                  child: const Icon(
                                    Icons.remove,
                                    color: Colors.black,
                                    size: 16,
                                  )),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 3),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 3, vertical: 2),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    color: Colors.grey.shade100),
                                child: Text(
                                  _itemCount.toString(),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              InkWell(
                                  onTap: () => setState(() {
                                        _itemCount++;
                                        totalPriceNow = totalPriceNow + price;
                                      }),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.black87,
                                    size: 16,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CardProductListForWhistList extends GetxController {
  var productCount = 0.obs;
  var productName = ''.obs;
  var productPrice = 0.obs;
  var productSize = ''.obs;
  var productColor = ''.obs;
  var productImageURL = ''.obs;
  var itemCount = 0.obs;
  var totalPriceNow = 0.obs;
  var index = 0.obs;
  var price = 0.obs;
  BuildContext context;
  Function()? onPressed;

  CardProductListForWhistList(
      this.productColor,
      this.productName,
      this.productSize,
      this.productCount,
      this.context,
      this.productPrice,
      this.productImageURL,
      this.index,
      this.onPressed);

  @override
  void onInit() {
    totalPriceNow.value = productPrice.value;
    price.value = productPrice.value;
    super.onInit();
    productCartForWhisList();
  }

  Widget productCartForWhisList() {
    return InkWell(
      onTap: onPressed,
      onLongPress: () {
        HapticFeedback.mediumImpact();
        Get.defaultDialog(
            radius: 7,
            titlePadding: const EdgeInsets.all(8),
            contentPadding: const EdgeInsets.all(8),
            title: productName.value,
            content: Image.asset(productImageURL.value));
      },
      child: AnimationConfiguration.staggeredList(
        position: index.value,
        delay: const Duration(milliseconds: 100),
        child: SlideAnimation(
          duration: const Duration(milliseconds: 2500),
          curve: Curves.fastLinearToSlowEaseIn,
          horizontalOffset: 30,
          verticalOffset: 300.0,
          child: FlipAnimation(
            duration: const Duration(milliseconds: 3000),
            curve: Curves.fastLinearToSlowEaseIn,
            flipAxis: FlipAxis.y,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 5.5,
              padding: const EdgeInsets.only(
                  left: 13, right: 13, top: 13, bottom: 13),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                image: DecorationImage(
                                  image: AssetImage(productImageURL
                                          .value.isNotEmpty
                                      ? productImageURL.value
                                      : 'assets/images/no-available-image.png'),
                                  fit: BoxFit.cover,
                                  onError: (exception, stackTrace) =>
                                      const Text('error'),
                                )),
                          ),
                          const SizedBox(width: 12),
                          Flexible(
                            child: Container(
                              color: Colors.transparent,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    productName.value.isNotEmpty
                                        ? productName.value
                                        : '-',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: sfPro(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    formatCurrency.format(totalPriceNow),
                                    style: sfPro(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                          'Ukuran : ${productSize.value.isNotEmpty ? productSize.value.toUpperCase() : "-"}',
                                          style: sfPro(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 12)),
                                      const SizedBox(width: 5),
                                      Text(
                                        'Warna : ${productColor.value.isNotEmpty ? productColor.value : "-"}',
                                        style: sfPro(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 2,
                                  spreadRadius: 2,
                                ),
                              ],
                              color: Colors.white),
                          child: Row(
                            children: [
                              InkWell(
                                  onTap: itemCount.value != 0
                                      ? () {
                                          itemCount--;
                                          totalPriceNow.value =
                                              totalPriceNow.value -
                                                  productPrice.value;
                                          update();
                                        }
                                      : null,
                                  child: const Icon(
                                    Icons.remove,
                                    color: Colors.black,
                                    size: 16,
                                  )),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 3),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 3, vertical: 2),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    color: Colors.grey.shade100),
                                child: Text(
                                  itemCount.value.toString(),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    itemCount.value++;
                                    totalPriceNow.value = totalPriceNow.value +
                                        productPrice.value;
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.black87,
                                    size: 16,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget cardProductForCart(context,
    {int? index,
    String? productName,
    int? productPrice,
    double? ratings,
    String? urlImage,
    Function()? onPressed,
    Function()? onFavorite,
    Function()? onAdd}) {
  return InkWell(
    onTap: onPressed,
    onLongPress: () {
      HapticFeedback.mediumImpact();
      Get.defaultDialog(
          radius: 7,
          titlePadding: const EdgeInsets.all(8),
          contentPadding: const EdgeInsets.all(8),
          title: productName ?? '-',
          content:
              Image.asset(urlImage ?? 'assets/images/no-available-image.png'));
    },
    child: AnimationConfiguration.staggeredList(
      position: index ?? 0,
      delay: const Duration(milliseconds: 100),
      child: SlideAnimation(
        duration: const Duration(milliseconds: 2500),
        curve: Curves.fastLinearToSlowEaseIn,
        horizontalOffset: 30,
        verticalOffset: 300.0,
        child: FlipAnimation(
          duration: const Duration(milliseconds: 3000),
          curve: Curves.fastLinearToSlowEaseIn,
          flipAxis: FlipAxis.y,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5.5,
            padding:
                const EdgeInsets.only(left: 13, right: 13, top: 13, bottom: 13),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.black.withOpacity(0.2),
              //     blurRadius: 25,
              //     spreadRadius: 10,
              //   ),
              // ],
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                image: AssetImage(urlImage ??
                                    'assets/images/no-available-image.png'),
                                fit: BoxFit.cover,
                                onError: (exception, stackTrace) =>
                                    const Text('error'),
                              )),
                        ),
                        const SizedBox(width: 12),
                        Flexible(
                          child: Container(
                            color: Colors.transparent,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  productName ?? '-',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: sfPro(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  formatCurrency.format(150000),
                                  style: sfPro(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                const SizedBox(height: 5),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 2, vertical: 2),
                                  width: 45,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.green.shade700,
                                      borderRadius: BorderRadius.circular(3)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.star_border,
                                          color: Colors.white, size: 16),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                        ratings != null
                                            ? ratings.toString()
                                            : '3.5',
                                        style: sfPro(
                                            color: Colors.white, fontSize: 12),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child: Row(
                          children: [
                            InkWell(
                                onTap: () {},
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.black,
                                  size: 16,
                                )),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 3),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 3, vertical: 2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: Colors.grey.shade100),
                              child: const Text(
                                '3',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ),
                            InkWell(
                                onTap: () {},
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.black87,
                                  size: 16,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
