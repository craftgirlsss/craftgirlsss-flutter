import 'package:animated_button/animated_button.dart';
import 'package:craftgirlsss/src/controllers/GetxController/address_controller.dart';
import 'package:craftgirlsss/src/helpers/paddings/defaultpadding.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:craftgirlsss/src/view-models/loadings/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class ListOfAddress extends StatefulWidget {
  const ListOfAddress({super.key});

  @override
  State<ListOfAddress> createState() => _ListOfAddressState();
}

class _ListOfAddressState extends State<ListOfAddress> {
  AddressController addressC = Get.put(AddressController());

  @override
  void initState() {
    addressC.getProvince();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: ListView(
        padding: kDefaultPadding(),
        children: [
          Center(
            child: AnimatedButton(
              color: Colors.green.shade600,
              shape: BoxShape.rectangle,
              width: MediaQuery.of(context).size.width - 30,
              height: 43,
              onPressed: () {},
              enabled: true,
              shadowDegree: ShadowDegree.light,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.place,
                    color: Colors.white,
                    size: 19,
                  ),
                  const SizedBox(width: 7),
                  Text(
                    'Gunakan lokasi saat ini',
                    style: titleInter(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 15),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          const Text('Provinsi'),
          const SizedBox(height: 10),
          Obx(() => addressC.isLoadingGetProvince.value == true
              ? kLoading()
              : addressC.addressesModelsList.isNotEmpty
                  ? AnimationLimiter(
                      child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: const ScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {},
                              child: AnimationConfiguration.staggeredList(
                                  position: index,
                                  delay: const Duration(milliseconds: 150),
                                  child: SlideAnimation(
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      horizontalOffset: 30,
                                      verticalOffset: 300,
                                      child: FlipAnimation(
                                          duration: const Duration(
                                              milliseconds: 3000),
                                          curve: Curves.fastLinearToSlowEaseIn,
                                          flipAxis: FlipAxis.y,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                10,
                                            padding: const EdgeInsets.only(
                                                left: 13,
                                                right: 13,
                                                top: 13,
                                                bottom: 13),
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade200,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.2),
                                                  blurRadius: 25,
                                                  spreadRadius: 10,
                                                ),
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  addressC
                                                      .provinceModels
                                                      .value!
                                                      .rajaongkir
                                                      .results[index]
                                                      .province,
                                                  style: titleInter(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                              ],
                                            ),
                                          )))),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 5),
                          itemCount: addressC
                              .provinceModels.value!.rajaongkir.results.length),
                    )
                  : const Center(
                      child: Text('Gagal memuat data'),
                    ))
        ],
      ),
    );
  }
}
