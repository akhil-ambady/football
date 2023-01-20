class Products {
  String? _itemId;
  String? _itemName;
  String? _itemDesc;
  String? _itemImg;
  Category? _category;
  String? _itemPrice;
  String? _itemStock;
  double? _itemRating;

  String? get itemId => _itemId;
  String? get itemName => _itemName;
  String? get itemDesc => _itemDesc;
  String? get itemImg => _itemImg;
  Category? get category => _category;
  String? get itemPrice => _itemPrice;
  String? get itemStock => _itemStock;
  double? get itemRating => _itemRating;

  Products(
      {String? itemId,
      String? itemName,
      String? itemDesc,
      String? itemImg,
      Category? category,
      String? itemPrice,
      String? itemStock,
      double? itemRating}) {
    itemId = _itemId;
    itemName = _itemName;
    itemDesc = _itemDesc;
    itemImg = _itemImg;
    category = _category;
    itemPrice = _itemPrice;
    itemStock = _itemStock;
    itemRating = _itemRating;
  }

  Products.fromJson(Map<String, dynamic> json) {
    _itemId = json['item_id'];
    _itemName = json['item_name'];
    _itemDesc = json['item_desc'];
    _itemImg = json['item_img'];
    _category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    _itemPrice = json['item_price'];
    _itemStock = json['item_stock'];
    _itemRating = json['item_rating'];
  }

  Map<String, dynamic> toJson(Products prd) {
    var data = <String, dynamic>{};
    data['item_id'] = itemId;
    data['item_name'] = itemName;
    data['item_desc'] = itemDesc;
    data['item_img'] = itemImg;
    if (category != null) {
      data['category'] = category?.toJson();
    }
    data['item_price'] = itemPrice;
    data['item_stock'] = itemStock;
    data['item_rating'] = itemRating;
    return data;
  }
}

class Category {
  String? _categoryId;
  String? _categoryName;
  String? _categoryDesc;
  String? _categoryImg;

  String? get categoryId => _categoryId;
  String? get categoryName => _categoryName;
  String? get categoryDesc => _categoryDesc;
  String? get categoryImg => _categoryImg;

  Category(
      {String? categoryId,
      String? categoryName,
      String? categoryDesc,
      String? categoryImg}) {
    categoryId = _categoryId;
    categoryName = _categoryName;
    categoryDesc = _categoryDesc;
    categoryImg = _categoryImg;
  }

  Category.fromJson(Map<String, dynamic> json) {
    _categoryId = json['category_id'];
    _categoryName = json['category_name'];
    _categoryDesc = json['category_desc'];
    _categoryImg = json['category_img'];
  }

  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data['category_id'] = _categoryId;
    data['category_name'] = _categoryName;
    data['category_desc'] = _categoryDesc;
    data['category_img'] = _categoryImg;
    return data;
  }
}
