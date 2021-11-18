import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/constants/colors.dart';
import 'package:ecommerce/core/controllers/control_controller.dart';
import 'package:ecommerce/core/controllers/home_controller.dart';
import 'package:ecommerce/models/products/category_model.dart';
import 'package:ecommerce/models/products/product_model.dart';
import 'package:ecommerce/widgets/controls/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeScreen extends GetWidget<ControlController> {
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
    return GetBuilder<HomeController>(
      init: Get.put(HomeController()),
      builder: (controller) => controller.isLoading.value
          ? Center(
              child: CircularProgressIndicator(
              strokeWidth: 2.0,
              color: PRIMARY_COLOR,
            ))
          : Scaffold(
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
                        _categoriesListview(controller.categories),
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
                        _productsListview(controller.products)
                      ],
                    ),
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

  _categoriesListview(List<CategoryModel> categories) {
    return Container(
      height: 100.0,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {},
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        color: Colors.grey.shade100),
                    height: 60.0,
                    width: 60.0,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CachedNetworkImage(
                          imageUrl: categories[index].image!,
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        )),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CustomText(
                    text: categories[index].name!,
                    size: 14.0,
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
          itemCount: categories.length),
    );
  }

  _productsListview(List<ProductModel> products) {
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
                        child: CachedNetworkImage(
                            imageUrl: products[index].image,
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                            fit: BoxFit.fill),
                      ),
                    ],
                  )),
                  CustomText(
                    text: products[index].name,
                    size: 16.0,
                    alignment: Alignment.bottomLeft,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  CustomText(
                    text: products[index].brand,
                    size: 12.0,
                    color: Colors.grey,
                    alignment: Alignment.bottomLeft,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  CustomText(
                    text: '\$${products[index].price}',
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
          itemCount: products.length),
    );
  }
}
