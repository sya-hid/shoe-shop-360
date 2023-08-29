class BrandModel {
  late String? image;
  late int? totalItem;

  BrandModel({this.image, this.totalItem});
}

List<BrandModel> brands = [
  BrandModel(image: 'nike.svg', totalItem: 120),
  BrandModel(image: 'adidas.svg', totalItem: 130),
  BrandModel(image: 'Hugo_Boss-Logo.wine.svg', totalItem: 125),
  BrandModel(image: 'under_armour.svg', totalItem: 144),
  BrandModel(image: 'converse.svg', totalItem: 144),
];
