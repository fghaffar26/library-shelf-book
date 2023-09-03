class CategoryFood {
  CategoryFood({
    required this.categories,
  });
  List<Categories>? categories;

  CategoryFood.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    // categories = List.from(json['categories'])
    //     .map((e) => Categories.fromJson(e))
    //     .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    // final _data = <String, dynamic>{};
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    return data;
    // _data['categories'] = categories.map((e) => e.toJson()).toList();
    // return _data;
  }
}

class Categories {
  Categories({
    required this.idCategory,
    required this.strCategory,
    required this.strCategoryThumb,
    required this.strCategoryDescription,
  });
  late final String idCategory;
  late final String strCategory;
  late final String strCategoryThumb;
  late final String strCategoryDescription;

  Categories.fromJson(Map<String, dynamic> json) {
    idCategory = json['idCategory'];
    strCategory = json['strCategory'];
    strCategoryThumb = json['strCategoryThumb'];
    strCategoryDescription = json['strCategoryDescription'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['idCategory'] = idCategory;
    _data['strCategory'] = strCategory;
    _data['strCategoryThumb'] = strCategoryThumb;
    _data['strCategoryDescription'] = strCategoryDescription;
    return _data;
  }
}
