class ProfileModels {
  int? id;
  String? name, phone, email, urlProfile;
  bool? deleted, isVerified;

  ProfileModels(
      {this.id,
      this.name,
      this.urlProfile,
      this.email,
      this.deleted,
      this.isVerified,
      this.phone});

  factory ProfileModels.fromJson(Map<String, dynamic> json) {
    return ProfileModels(
        id: json['id'],
        name: json['name'] ?? '-',
        email: json['email'] ?? "-",
        urlProfile: json['url_profile'] ?? '-',
        isVerified: json['is_verified'],
        phone: json['phone'] ?? '0',
        deleted: json['deleted']);
  }
}
