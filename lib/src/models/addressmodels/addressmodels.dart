class AddressesModels {
  int? id;
  String? provinceName,
      cityName,
      vilagesName,
      postalCode,
      fullAddress,
      detailLainnya,
      aturSebagai,
      namaPenerima,
      noHpPenerima;
  bool? isDefault, deleted;

  AddressesModels(
      {this.id,
      this.namaPenerima,
      this.cityName,
      this.provinceName,
      this.fullAddress,
      this.deleted,
      this.vilagesName,
      this.postalCode,
      this.detailLainnya,
      this.aturSebagai,
      this.noHpPenerima,
      this.isDefault});

  factory AddressesModels.fromJson(Map<String, dynamic> json) {
    return AddressesModels(
        id: json['id'],
        namaPenerima: json['nama_penerima'],
        cityName: json['city_name'] ?? "-",
        noHpPenerima: json['nomor_hp_penerima'] ?? "-",
        fullAddress: json['full_address'].toString(),
        isDefault: json['is_default'],
        provinceName: json['province_name'],
        aturSebagai: json['atur_sebagai'],
        detailLainnya: json['detail_lainnya'],
        postalCode: json['postal_code'],
        vilagesName: json['vilages_name'],
        deleted: json['deleted']);
  }
}
