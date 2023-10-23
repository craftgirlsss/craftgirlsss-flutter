import 'package:craftgirlsss/src/models/tokomodels/tokomodels.dart';

class ProfileModels {
  int? id;
  String? name, phone, email, urlProfile, jenisKelamin, dateOfBirth;
  bool? deleted, isVerified;
  TokoModels? toko;

  ProfileModels(
      {this.id,
      this.name,
      this.dateOfBirth,
      this.jenisKelamin,
      this.urlProfile,
      this.email,
      this.deleted,
      this.isVerified,
      this.toko,
      this.phone});

  factory ProfileModels.fromJson(Map<String, dynamic> json) {
    return ProfileModels(
        id: json['id'],
        dateOfBirth: json['dob'] ?? 'Belum diset',
        name: json['name'] ?? '-',
        jenisKelamin: json['jenis_kelamin'] ?? 'Belum diset',
        email: json['email'] ?? "-",
        urlProfile: json['url_profile'] ?? '-',
        isVerified: json['is_verified'],
        phone: json['phone'] ?? '0',
        toko: json['cr_toko'] != null
            ? TokoModels.fromJson(json['cr_toko'])
            : json['cr_toko'],
        deleted: json['deleted']);
  }
}
