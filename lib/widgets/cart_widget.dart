import 'package:application5/model/productModel.dart';
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
                border: Border.all(color: const Color(0xffD9D9D9),width: 2,),
                borderRadius: BorderRadius.circular(15)
                ),
              ),
              const SizedBox(width: 5,),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cartItem.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: Color(0xff1A7431))),
                    
                    Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: Text("EGP${(cartItem.price*quantity)}",
                          style: const TextStyle(
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
                  decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage("images/x.png"))),
                ),
              ),
              Container(
                margin:  const EdgeInsets.only(right: 18,bottom: 5),
        
                width: 69,
                height: 25,
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffB7D7BE), width: 2)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {
                          cartController.removeProductFromCart(cartItem);
                        },
                        child: const Icon(
                          Icons.remove_rounded,
                          size: 20,
                          color: Color(0xff1A7431),
                        )),
                    Text("$quantity",
                        style: const TextStyle(
                          fontFamily: "WorkSans",
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color(0xff1A7431))),
                    InkWell(
                        onTap: () {
                          cartController.addProduct(cartItem);
                        },
                        child: const Icon(Icons.add_rounded,
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