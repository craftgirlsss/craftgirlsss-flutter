class KurirModels {
  int? id;
  String? name, status, descriptionRule;
  bool? deleted;

  KurirModels({
    this.id,
    this.name,
    this.status,
    this.descriptionRule,
    this.deleted,
  });

  factory KurirModels.fromJson(Map<String, dynamic> json) {
    return KurirModels(
        id: json['id'],
        name: json['name'] ?? '-',
        status: json['status'] ?? '-',
        deleted: json['deleted'] ?? false,
        descriptionRule: json['description_rule']);
  }
}
