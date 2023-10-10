import 'package:craftgirlsss/src/controllers/GetxController/address_controller.dart';
import 'package:craftgirlsss/src/view-models/appbars/appbar.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:craftgirlsss/src/view-models/listtiles/listtilelocations.dart';
import 'package:craftgirlsss/src/view-models/loadings/loading.dart';
import 'package:craftgirlsss/src/view-models/textfields/textfieldsearch.dart';
import 'package:craftgirlsss/src/views/profile/address/addaddress.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LokasiPengiriman extends StatefulWidget {
  const LokasiPengiriman({super.key});

  @override
  State<LokasiPengiriman> createState() => _LokasiPengirimanState();
}

class _LokasiPengirimanState extends State<LokasiPengiriman> {
  AddressController addressC = Get.put(AddressController());
  TextEditingController searchC = TextEditingController();
  Position? positionNow;
  String? _address;
  String jarak = "";
  double latkantor = -7.3783061, longkantor = 112.6857011;
  late double lat;
  late double long;
  String? myLongitude;
  String? myLatitude;
  final Set<Marker> _marker = {};

  void _getCurrentLocation() async {
    Position position = await _determinePosition();
    String address = await _getAddressFormLatLongOnline(position);
    setState(() {
      positionNow = position;
      lat = position.latitude;
      long = position.longitude;
      _address = address;
    });
  }

  void marker() async {
    Position pos = await Geolocator.getCurrentPosition();
    setState(() {
      _marker.add(
        Marker(
          markerId: const MarkerId("Lokasi saat ini"),
          position: LatLng(pos.latitude, pos.longitude),
          infoWindow: InfoWindow(
            title: "Posisi Anda Sekarang",
            snippet: _address,
          ),
        ),
      );
    });
    setState(() {
      myLongitude = pos.longitude.toString();
      myLatitude = pos.latitude.toString();
      jarak = Geolocator.distanceBetween(
              latkantor, longkantor, pos.latitude, pos.longitude)
          .floor()
          .toString();
    });
  }

  Future<Position> _determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<String> _getAddressFormLatLongOnline(Position param) async {
    try {
      List<Placemark> placemarkList = await placemarkFromCoordinates(
        param.latitude,
        param.longitude,
        localeIdentifier: "id",
      );
      Placemark place = placemarkList[0];
      return _address =
          "${place.country} ${place.postalCode} ${place.administrativeArea} ${place.subAdministrativeArea} ${place.locality} ${place.subLocality} ${place.thoroughfare} ${place.subThoroughfare} ${place.name}";
    } catch (e) {
      return "Log error$e";
    }
  }

  @override
  void initState() {
    addressC.fetchAllAddress(context);
    _getCurrentLocation();
    marker();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: kAppBar(context,
            isTitle: true,
            autoImplyLeading: true,
            titleText: "Lokasi Pengiriman"),
        body: ListView(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 0),
          children: [
            kSearchTextField(
                controller: searchC, hintText: "Cari kabupaten atau kota"),
            const SizedBox(height: 5),
            _address != null
                ? kMyCurrentLocation(
                    descriptionLocation: _address,
                    isDefault: true,
                    onTap: () {})
                : const SizedBox(
                    height: 0,
                    width: 0,
                  ),
            const SizedBox(height: 10),
            Text("Daftar alamat saya",
                style: titleInter(
                    color: Colors.black87,
                    fontSize: 15,
                    fontWeight: FontWeight.normal)),
            const SizedBox(height: 10),
            Obx(
              () => addressC.isLoadingLoadData.value == true
                  ? SizedBox(height: 150, child: kLoading())
                  : addressC.addressesModelsList.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: addressC.addressesModelsList.length,
                          scrollDirection: Axis.vertical,
                          physics: const ScrollPhysics(),
                          itemBuilder: (context, index) => kListTileMyLocation(
                              title:
                                  '${addressC.addressesModelsList[index].namaPenerima} | ${addressC.addressesModelsList[index].noHpPenerima}',
                              descriptionLocation:
                                  "${addressC.addressesModelsList[index].vilagesName}\n${addressC.addressesModelsList[index].cityName}\n${addressC.addressesModelsList[index].provinceName}\n${addressC.addressesModelsList[index].detailLainnya}\n${addressC.addressesModelsList[index].fullAddress}\n${addressC.addressesModelsList[index].postalCode}",
                              isDefault:
                                  addressC.addressesModelsList[index].isDefault,
                              onTap: () {}),
                        )
                      : const Center(child: Text('Tidak ada data alamat')),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.green.shade300,
          elevation: 0,
          onPressed: () {
            Get.to(() => const AddAddressPage());
          },
          label: const Text('Tambah'),
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }
}
