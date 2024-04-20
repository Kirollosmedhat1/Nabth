class ProductModel{
   late String name ;
   late String image ;
   late double price ;

  ProductModel({
    required this.name,
    required this.image,
   required this.price
  });
  
  ProductModel.fromMap(Map<String , dynamic> data){
    name = data['name'];
    image=data ['image'] ;
    price=data["price"].toDouble();
  }
}


