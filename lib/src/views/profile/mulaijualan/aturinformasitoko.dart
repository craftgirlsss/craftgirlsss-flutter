import 'package:craftgirlsss/src/controllers/GetxController/kurir_controller.dart';
import 'package:craftgirlsss/src/controllers/GetxController/profile_controller.dart';
import 'package:craftgirlsss/src/view-models/appbars/appbar.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:craftgirlsss/src/view-models/listtiles/listtileprofile.dart';
import 'package:craftgirlsss/src/views/profile/editprofile/editemail.dart';
import 'package:craftgirlsss/src/views/profile/jasakuriruntuktoko/jasakurirpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AturInformasiToko extends StatefulWidget {
  const AturInformasiToko({super.key});

  @override
  State<AturInformasiToko> createState() => _AturInformasiTokoState();
}

class _AturInformasiTokoState extends State<AturInformasiToko> {
  var lengthText = 0.obs;
  HomeController controller = Get.put(HomeController());
  ProfileController profileController = Get.put(ProfileController());
  KurirController kurirController = Get.put(KurirController());
  TextEditingController? namaTokoC;

  @override
  void initState() {
    super.initState();
    namaTokoC = TextEditingController(
        text: profileController.profileModels[0].toko != null
            ? profileController.profileModels[0].toko?.name
            : '-');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        // backgroundColor: Colors.white,
        appBar:
            defaultAppBar(autoImplyLeading: true, title: "Atur Informasi Toko"),
        body: Obx(() => Container(
              color: Colors.grey.shade100,
              child: Stepper(
                elevation: 2,
                type: StepperType.horizontal,
                controlsBuilder: (context, details) {
                  return SizedBox(
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CupertinoButton(
                          onPressed: controller.currentStep.value == 0
                              ? null
                              : () {
                                  controller.currentStep.value--;
                                },
                          child: const Text('Sebelumnya'),
                        ),
                        CupertinoButton(
                          onPressed: () {
                            if (controller.currentStep.value ==
                                buildStep().length - 1) {
                              // print("Send data to server");
                            } else {
                              controller.currentStep.value++;
                            }
                          },
                          child: const Text('Selanjutnya'),
                        ),
                      ],
                    ),
                  );
                },
                steps: buildStep(),
                currentStep: controller.currentStep.value,
                onStepContinue: () {
                  if (controller.currentStep.value == buildStep().length - 1) {
                    // print("Send data to server");
                  } else {
                    controller.currentStep.value++;
                  }
                },
                onStepCancel: () {
                  controller.currentStep.value == 0
                      ? null
                      : controller.currentStep.value--;
                },
                // onStepTapped: (index) {
                //   controller.currentStep.value = index;
                // },
              ),
            )),
      ),
    );
  }

  List<Step> buildStep() {
    return [
      Step(
          title: Text(
            'Atur Informasi Toko',
            style: sfPro(
                color: Colors.black54,
                fontWeight: FontWeight.normal,
                fontSize: 14),
          ),
          content: ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: [
              Container(
                // padding: const EdgeInsets.only(left: 6, right: 6, top: 6),
                decoration: const BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Nama Toko',
                        style: sfPro(
                            color: Colors.black45,
                            fontSize: 15,
                            fontWeight: FontWeight.normal),
                        children: const <TextSpan>[
                          TextSpan(
                              text: '*',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.red)),
                        ],
                      ),
                    ),
                    Obx(() => Text(
                          '${lengthText.value}/30',
                          style: sfPro(
                              color: Colors.black54,
                              fontSize: 14,
                              fontWeight: FontWeight.normal),
                        ))
                  ],
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 40,
                child: TextField(
                  // maxLength: 30,
                  onChanged: (value) {
                    lengthText.value = value.length;
                  },
                  style: sfPro(
                      color: Colors.black54,
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                  controller: namaTokoC,
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.all(12),
                      prefixIconColor: Colors.black54,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8)))),
                ),
              ),
              const SizedBox(height: 3),
              listTileWithoutIconLeading(
                size: 15,
                withDivider: false,
                color: Colors.white,
                value: "Atur",
                withBorderRadius: true,
                bottomLeftRadius: 8,
                bottomRightRadius: 8,
                onPressed: () {
                  Get.to(() => const JasaKurirPage());
                },
                title: "Atur Alamat & Layanan Pengiriman",
              ),
              const SizedBox(height: 5),
              Text(
                'Mohon memasukkan alamat toko dan memilih jasa pengiriman yang telah tersedia.',
                style: sfPro(color: Colors.black45),
              ),
              const SizedBox(height: 8),
              Obx(
                () => listTileWithoutIconLeading(
                  size: 15,
                  withDivider: false,
                  color: Colors.white,
                  value: profileController.profileModels[0].phone != null
                      ? profileController.profileModels[0].phone
                          ?.replaceRange(2, 8, "****")
                      : '-',
                  withBorderRadius: true,
                  topLeftRadius: 8,
                  topRigthRadius: 8,
                  onPressed: () {
                    // Get.to(() => EditprofileName(name: namaC));
                  },
                  title: "No.Hp",
                ),
              ),
              const SizedBox(height: 3),
              Obx(
                () => listTileWithoutIconLeading(
                  size: 15,
                  withDivider: false,
                  color: Colors.white,
                  value: profileController.profileModels[0].email != null
                      ? profileController.profileModels[0].email
                          ?.replaceRange(2, 8, "*****")
                      : '-',
                  withBorderRadius: true,
                  bottomLeftRadius: 8,
                  bottomRightRadius: 8,
                  onPressed: () {
                    Get.to(() => EditEmail(
                        email: profileController.profileModels[0].email));
                  },
                  title: 'Email',
                ),
              ),
            ],
          ),
          isActive: controller.currentStep.value >= 0,
          state: controller.currentStep.value > 0
              ? StepState.complete
              : StepState.indexed),
      Step(
          title: Text(
            'Upload Produk',
            style: sfPro(
                color: Colors.black54,
                fontWeight: FontWeight.normal,
                fontSize: 14),
          ),
          content: Container(
            height: 100,
            color: Colors.green,
          ),
          isActive: controller.currentStep.value >= 1,
          state: controller.currentStep.value > 1
              ? StepState.complete
              : StepState.indexed),
      // Step(
      //     title: Text('Confirm'),
      //     content: Container(
      //       height: 100,
      //       color: Colors.deepPurpleAccent,
      //     ),
      //     isActive: controller.currentStep.value >= 2)
    ];
  }
}

class HomeController extends GetxController {
  var currentStep = 0.obs;
  @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  @override
  void onClose() {}
}
