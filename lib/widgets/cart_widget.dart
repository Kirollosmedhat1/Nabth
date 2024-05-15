import 'package:application5/model/productModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:application5/controller/cont/cart_controller.dart';
import 'package:get/get.dart';

class CartItemsWidget extends StatelessWidget {
  final CartItem cartItem;
  final int index;
  final int quantity;

  CartItemsWidget({
    Key? key,
    required this.index,
    required this.cartItem,
    required this.quantity,
  }) : super(key: key);
  final CartController cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 70,
                height: 69,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(
                    cartItem.image,
                  ),
                  fit: BoxFit.fill,
                ),
                border: Border.all(color: Color(0xffD9D9D9),width: 2,),
                borderRadius: BorderRadius.circular(15)
                ),
              ),
              SizedBox(width: 5,),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cartItem.name,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: Color(0xff1A7431))),
                    
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child: Text("EGP${(cartItem.price*quantity)}",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(0xff1A7431))),
                    ),
                    
                  
            ],
          ),
            ],
          ),
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  cartController.removeItem(cartItem);
                },
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("images/x.png"))),
                ),
              ),
              Container(
                margin:  EdgeInsets.only(right: 18,bottom: 5),
        
                width: 69,
                height: 25,
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffB7D7BE), width: 2)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {
                          cartController.removeProductFromCart(cartItem);
                        },
                        child: Icon(
                          Icons.remove_rounded,
                          size: 20,
                          color: Color(0xff1A7431),
                        )),
                    Text("$quantity",
                        style: TextStyle(
                          fontFamily: "WorkSans",
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color(0xff1A7431))),
                    InkWell(
                        onTap: () {
                          cartController.addProduct(cartItem);
                        },
                        child: Icon(Icons.add_rounded,
                            size: 20, color: Color(0xff1A7431))),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}












// GestureDetector(
    //   onTap: () {
    //     // Here you can add the product to the cart
    //     // cartController.addProduct(item);
    //     Get.snackbar(
    //       'Added to Cart',
    //       '${cartItem.name} added to your cart.', // Providing a message with the item name
    //       snackPosition: SnackPosition.BOTTOM,
    //       backgroundColor: Colors.green,
    //       colorText: Colors.black,
    //     );
    //   },
      // child: