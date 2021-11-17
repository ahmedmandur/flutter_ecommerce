import 'package:ecommerce/core/constants/colors.dart';
import 'package:ecommerce/core/controllers/auth_controller.dart';
import 'package:ecommerce/widgets/controls/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeScreen extends GetWidget<AuthController> {
  var names = [
    "Men",
    "Women",
    "Devices",
    "Kids",
    "Men",
    "Women",
    "Devices",
    "Kids"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buttomNavigationBar(),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsDirectional.only(
              top: 70.0,
              bottom: 30.0,
              start: 20.0,
              end: 20.0,
            ),
            child: Column(
              children: [
                _searchBarWidget(),
                SizedBox(
                  height: 40.0,
                ),
                CustomText(
                  text: "Categories",
                  size: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 20.0,
                ),
                _categoriesListview(),
                SizedBox(
                  height: 60.0,
                ),
                Row(
                  children: [
                    CustomText(
                      text: "Best Selling",
                      size: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                    Spacer(),
                    CustomText(
                      text: "See All",
                      size: 16.0,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                _productsListview()
              ],
            ),
          ),
        ),
      ),
    );
  }

  _searchBarWidget() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.grey.shade200,
      ),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
              size: 30.0,
            )),
      ),
    );
  }

  _categoriesListview() {
    return Container(
      height: 100.0,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Colors.grey.shade100),
                  height: 60.0,
                  width: 60.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/images/Icon_Mens Shoe.png",
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                CustomText(
                  text: names[index],
                  size: 14.0,
                ),
              ],
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 20.0,
            );
          },
          itemCount: names.length),
    );
  }

  _productsListview() {
    return Container(
      height: 350.0,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Column(
                children: [
                  Container(
                      child: Column(
                    children: [
                      Container(
                        height: 220.0,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Image.asset(
                          "assets/images/product_image.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  )),
                  CustomText(
                    text: 'BeoPlay Speaker',
                    size: 16.0,
                    alignment: Alignment.bottomLeft,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  CustomText(
                    text: 'Bang and Olufsen',
                    size: 12.0,
                    alignment: Alignment.bottomLeft,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  CustomText(
                    text: '\$755',
                    size: 16.0,
                    alignment: Alignment.bottomLeft,
                    color: PRIMARY_COLOR,
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 20.0,
            );
          },
          itemCount: names.length),
    );
  }

  _buttomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          activeIcon: Column(
            children: [
              CustomText(
                text: 'Explore',
                size: 14.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                alignment: Alignment.center,
              ),
              CustomText(
                text: '.',
                size: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                alignment: Alignment.center,
              ),
            ],
          ),
          icon: Image.asset(
            "assets/icons/Icon_Explore.png",
            width: 20.0,
            fit: BoxFit.contain,
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          activeIcon: Text('Cart'),
          icon: Image.asset(
            "assets/icons/Icon_Cart.png",
            width: 20.0,
            fit: BoxFit.contain,
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          activeIcon: Text('Account'),
          icon: Image.asset(
            "assets/icons/Icon_User.png",
            width: 20.0,
            fit: BoxFit.contain,
          ),
          label: "",
        ),
      ],
      currentIndex: 0,
      onTap: (index) {},
    );
  }
}
