class ProductData {
  int? id;
  String? brand;
  String? name;
  String? price;
  String? priceSign;
  String? currency;
  String? imageLink;
  String? productLink;
  String? websiteLink;
  String? description;
  double? rating;
  String? category;
  String? productType;
  List<String>? tagList;
  String? createdAt;
  String? updatedAt;
  String? productApiUrl;
  String? apiFeaturedImage;
  List<ProductColor>? productColors;

  ProductData(
      {this.id,
        this.brand,
        this.name,
        this.price,
        this.priceSign,
        this.currency,
        this.imageLink,
        this.productLink,
        this.websiteLink,
        this.description,
        this.rating,
        this.category,
        this.productType,
        this.tagList,
        this.createdAt,
        this.updatedAt,
        this.productApiUrl,
        this.apiFeaturedImage,
        this.productColors});

  ProductData.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    brand = json['brand'];
    name = json['name'];
    price = json['price'];
    priceSign = json['price_sign'];
    currency = json['currency'];
    imageLink = json['image_link'];
    productLink = json['product_link'];
    websiteLink = json['website_link'];
    description = json['description'];
    rating = json['rating'];
    category = json['category'];
    productType = json['product_type'];
    if (json['tag_list'] != null) {
      tagList = <String>[];
      json['tag_list'].forEach((v) {
        tagList!.add(v.toString());
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    productApiUrl = json['product_api_url'];
    apiFeaturedImage = json['api_featured_image'];
    if (json['product_colors'] != null) {
      productColors = <ProductColor>[];
      json['product_colors'].forEach((v) {
        productColors!.add(ProductColor.fromJson(v));
      });
    }
  }
}

class ProductColor{
  String? hex_value;
  String? colour_name;

  ProductColor({this.hex_value, this.colour_name});

  ProductColor.fromJson(Map<dynamic, dynamic> json){
    hex_value = json['hex_value'];
    colour_name = json['colour_name'];
  }
}
