class TokoModels {
  int? id;
  String? name, alamatToko, deskripsiToko;
  bool? deleted;
  ProductCategory? productCategory;
  Product? product;

  TokoModels(
      {this.id,
      this.name,
      this.alamatToko,
      this.deskripsiToko,
      this.deleted,
      this.product,
      this.productCategory});

  factory TokoModels.fromJson(Map<String, dynamic> json) {
    return TokoModels(
        id: json['id'],
        name: json['nama'] ?? '-',
        alamatToko: json['alamat'] ?? '-',
        deskripsiToko: json['deskripsi_toko'] ?? '-',
        productCategory: json['product_category'] != null
            ? ProductCategory.fromJson(json['product_category'])
            : json['product_category'],
        product: json['product_id'] != null
            ? Product.fromJson(json['product_id'])
            : json['product_id'],
        deleted: json['deleted'] ?? false);
  }
}

class ProductCategory {
  int? id;
  String? name, urlImage;
  bool? deleted;

  ProductCategory({this.id, this.name, this.deleted, this.urlImage});

  factory ProductCategory.fromJson(Map<String, dynamic> json) {
    return ProductCategory(
        id: json['id'],
        name: json['name'] ?? '-',
        urlImage: json['url_image'] ?? '-',
        deleted: json['deleted'] ?? false);
  }
}

class Product {
  int? id, sellPrice, buyPrice, jumlahTerjual, stok;
  String? name, description;
  bool? deleted;

  Product(
      {this.id,
      this.name,
      this.deleted,
      this.buyPrice,
      this.description,
      this.jumlahTerjual,
      this.sellPrice,
      this.stok});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        name: json['name'] ?? '-',
        description: json['description'] ?? '-',
        buyPrice: json['buy_price'] ?? 0,
        sellPrice: json['sell_price'] ?? 0,
        jumlahTerjual: json['jumlah_terjual'] ?? 0,
        stok: json['stok'] ?? 0,
        deleted: json['deleted'] ?? false);
  }
}
