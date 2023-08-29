class ProductModel {
  final String name, description, subCategory;
  final List<String> images;
  final int price;
  final double rate;

  ProductModel(
      {required this.name,
      required this.description,
      required this.subCategory,
      required this.images,
      required this.price,
      required this.rate});
}

List<ProductModel> products = [
  ProductModel(
      name: 'Nike Zegama',
      subCategory: 'Men\'s Trail-Running Shoes',
      description:
          'Navigate the up and downs of uncompromising terrain with the Nike Zegama. Developed with great grip and stability, it has you covered, so you can keep climbing and reach greater personal heights when the going gets grimy and gritty. Whether it\'s a challenging, rocky landscape going uphill or a steep, slick decline down a treacherous trail, feel confident when you decide to off-road it.',
      images: ['imageedit_22_9785218146.png', 'imageedit_24_3499193326.png'],
      price: 2329000,
      rate: 4.5),
  ProductModel(
      name: 'Nike Downshifter 12',
      subCategory: 'Men\'s Road Running Shoes (Extra Wide)',
      description:
          'Take those first steps on your running journey in the Nike Downshifter 12. Made from at least 20% recycled content by weight, it has a supportive fit and stable ride, with a lightweight feel that easily transitions from your workout to hangout. Your trek begins. Lace up and hit the road.',
      images: ['imageedit_4_9483072537.png', 'imageedit_2_4777422206.png'],
      price: 819000,
      rate: 4.4),
  ProductModel(
      name: 'Nike Air Max 95 Essential',
      subCategory: 'Men\'s Shoe',
      description:
          'Taking inspiration from the human body and running DNA, the Nike Air Max 95 Essential mixes unbelievable comfort with head-turning style. The iconic side panels represent muscles while visible Nike Air in the heel and forefoot cushions your every step.',
      images: ['imageedit_10_6829801789.png', 'imageedit_12_8660011302.png'],
      price: 2389000,
      rate: 4.8),
  ProductModel(
      name: 'Nike Air Max SC',
      subCategory: 'Women\'s Shoes',
      description:
          'With its easy-going lines, heritage athletics look and, of course, visible Air cushioning, the Nike Air Max SC is the perfect finish to any outfit. The rich mixture of materials adds depth while making it a durable and lightweight shoe for everyday wear.',
      images: ['imageedit_2_2933087119.png', 'imageedit_4_2300774502.png'],
      price: 1099000,
      rate: 4.8),
  ProductModel(
      name: 'Nike Run Swift 3',
      subCategory: 'Women\'s Road Running Shoes',
      description:
          'Whatever the run, the Swift 3 will be there with undying support and devotion. It can help you get out the door for an easy 3 at the end of the day or an intense 2-mile there-and-back with a modified design that\'s supportive, durable and all-round comfortable. They\'ll help you conquer short distances, sure, but also get you from point A to point B as you navigate the ever-changing rhythms of everyday life.',
      images: ['imageedit_6_4647623048.png', 'imageedit_8_2176639691.png'],
      price: 1129000,
      rate: 0),
  ProductModel(
      name: 'Nike React Revision',
      subCategory: 'Women\'s Shoes',
      description:
          'You could run to the office, the shops and to the party. Or walk because you know exactly which shoes you\'re gonna wear. The React Revision is all about easy styling and getting going. From the comfort collar to the lightweight, durable Nike React cushioning, it\'s a revolution in choice-making.',
      images: ['imageedit_14_2141339905.png', 'imageedit_16_7556658894.png'],
      price: 1828000,
      rate: 4),
  ProductModel(
      name: 'Nike ACG Mountain Fly 2 Low',
      subCategory: 'Men\'s Shoes',
      description:
          'On the trail, details matter. Fast, rugged and ready for whatever wildness comes your way, the updated ACG Mountain Fly 2 is here to take you to the top. Over glacial-smoothed granite and root-twisted trails, we\'ve reinforced every step with an extended toe cap and mountain-tough rubber sidewalls. Don\'t worry about pushing your hardest either—the breathable upper helps stop you from overheating and lets you air out quickly when wet.',
      images: ['imageedit_18_7564466054.png', 'imageedit_20_7394398350.png'],
      price: 2018000,
      rate: 4.3)
];
