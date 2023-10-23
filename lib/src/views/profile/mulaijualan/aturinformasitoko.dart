import 'package:craftgirlsss/src/controllers/GetxController/profile_controller.dart';
import 'package:craftgirlsss/src/view-models/appbars/appbar.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:craftgirlsss/src/view-models/listtiles/listtileprofile.dart';
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
  TextEditingController? namaTokoC;

  @override
  void initState() {
    super.initState();
    namaTokoC = TextEditingController(
        text: profileController.profileModels[0].toko?.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar:
          defaultAppBar(autoImplyLeading: true, title: "Atur Informasi Toko"),
      body: Obx(() => Container(
            // color: Colors.white,
            child: Stepper(
              elevation: 1,
              type: StepperType.horizontal,
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
              onStepTapped: (index) {
                controller.currentStep.value = index;
              },
            ),
          )),
    );
  }

  List<Step> buildStep() {
    return [
      Step(
          title: Text(
            'Atur Informasi Toko',
            style: sfPro(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 12),
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
                            color: Colors.black54,
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
                value: "",
                withBorderRadius: true,
                bottomLeftRadius: 8,
                bottomRightRadius: 8,
                onPressed: () {
                  // Get.to(() => EditprofileName(name: namaC));
                },
                title: "Atur Alamat & Layanan Pengiriman",
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
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 12),
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
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
