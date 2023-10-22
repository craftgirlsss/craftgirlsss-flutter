class ProfileModels {
  int? id;
  String? name, phone, email, urlProfile, jenisKelamin, dateOfBirth, namaToko;
  bool? deleted, isVerified;

  ProfileModels(
      {this.id,
      this.name,
      this.dateOfBirth,
      this.namaToko,
      this.jenisKelamin,
      this.urlProfile,
      this.email,
      this.deleted,
      this.isVerified,
      this.phone});

  factory ProfileModels.fromJson(Map<String, dynamic> json) {
    return ProfileModels(
        id: json['id'],
        dateOfBirth: json['dob'] ?? 'Belum diset',
        namaToko: json['nama_toko'] ?? 'Belum diset',
        name: json['name'] ?? '-',
        jenisKelamin: json['jenis_kelamin'] ?? 'Belum diset',
        email: json['email'] ?? "-",
        urlProfile: json['url_profile'] ?? '-',
        isVerified: json['is_verified'],
        phone: json['phone'] ?? '0',
        deleted: json['deleted']);
  }
}
