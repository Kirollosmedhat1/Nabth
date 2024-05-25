class CartItem {
  final String name;
  final double price;
  final int quantity;
  final String image;

  CartItem({
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
  });

  Map<String, dynamic> toJson() {
    return {
    
      'name': name,
      'price': price,
      'quantity': quantity,
      'image': image,
    };
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      name: json['name'],
      price: json['price'],
      quantity: json['quantity'],
      image: json['image'],
    );
  }
}
