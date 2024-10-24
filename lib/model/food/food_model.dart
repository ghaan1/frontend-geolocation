class FoodItem {
  final String name;
  final String category;
  final double price;
  final String description;
  final String imagePath;
  final double rating;
  bool? favorite = false;

  FoodItem({
    required this.name,
    required this.category,
    required this.price,
    required this.description,
    required this.imagePath,
    required this.rating,
    this.favorite,
  });
  void toggleFavorite() {
    if (favorite == null) {
      favorite = true;
    } else {
      favorite = !favorite!;
    }
  }
}

List<FoodItem> foodItems = [
  FoodItem(
      name: 'Ramen Hot 1',
      category: 'Noodles',
      price: 10.99,
      description: 'Ramen Sedap Mantap Hura Huraa Ugh Mak nyus',
      imagePath: 'assets/images/list-1.png',
      rating: 4.9,
      favorite: null),
  FoodItem(
      name: 'Ramen Hot 2',
      category: 'Noodles',
      price: 10.99,
      description: 'Ramen Sedap Mantap Hura Huraa Ugh Mak nyus',
      imagePath: 'assets/images/list-2.png',
      rating: 2.9,
      favorite: null),
  FoodItem(
      name: 'Ramen Hot 3',
      category: 'Noodles',
      price: 10.99,
      description: 'Ramen Sedap Mantap Hura Huraa Ugh Mak nyus',
      imagePath: 'assets/images/list-3.png',
      rating: 1.9,
      favorite: null),
  FoodItem(
      name: 'Ramen Hot 4',
      category: 'Noodles',
      price: 10.99,
      description: 'Ramen Sedap Mantap Hura Huraa Ugh Mak nyus',
      imagePath: 'assets/images/list-4.png',
      rating: 5.0,
      favorite: null),
  FoodItem(
      name: 'Ramen Hot 5',
      category: 'Noodles',
      price: 10.99,
      description: 'Ramen Sedap Mantap Hura Huraa Ugh Mak nyus',
      imagePath: 'assets/images/list-5.png',
      rating: 3.2,
      favorite: null),
  FoodItem(
      name: 'Ramen Hot 6',
      category: 'Ramens',
      price: 10.99,
      description: 'Ramen Sedap Mantap Hura Huraa Ugh Mak nyus',
      imagePath: 'assets/images/list-1.png',
      rating: 3.1,
      favorite: null),
  FoodItem(
      name: 'Ramen Hot 7',
      category: 'Ramens',
      price: 10.99,
      description: 'Ramen Sedap Mantap Hura Huraa Ugh Mak nyus',
      imagePath: 'assets/images/list-2.png',
      rating: 4.7,
      favorite: null),
  FoodItem(
      name: 'Ramen Hot 8',
      category: 'Ramens',
      price: 10.99,
      description: 'Ramen Sedap Mantap Hura Huraa Ugh Mak nyus',
      imagePath: 'assets/images/list-3.png',
      rating: 0.2,
      favorite: null),
  FoodItem(
      name: 'Ramen Hot 9',
      category: 'Ramens',
      price: 10.99,
      description: 'Ramen Sedap Mantap Hura Huraa Ugh Mak nyus',
      imagePath: 'assets/images/list-4.png',
      rating: 4.9,
      favorite: null),
  FoodItem(
      name: 'Ramen Hot 10',
      category: 'Ramens',
      price: 10.99,
      description: 'Ramen Sedap Mantap Hura Huraa Ugh Mak nyus',
      imagePath: 'assets/images/list-5.png',
      rating: 4.4,
      favorite: null),
];
