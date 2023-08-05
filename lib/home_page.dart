import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shopping_cart/model/product.dart';
import 'package:shopping_cart/product_page.dart';
import 'package:shopping_cart/service/product_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getCategories();
  }

  List<Category> _categories = [];
  getCategories() {
    _categories = ProductService.getInstance().getCatergories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shadowColor: Color.fromARGB(255, 137, 36, 231),
          title: Text("Home"),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: _categories.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                index == 0
                    ? const Padding(
                        padding: EdgeInsets.only(top: 18.0, bottom: 10.0),
                        child: Text(
                          "Select one category",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      )
                    : Container(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ProductPage(
                                  id: _categories[index].id,
                                  name: _categories[index].name,
                                )));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(235, 113, 47, 235)
                              .withOpacity(0.7)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Text(
                          _categories[index].name!.toUpperCase(),
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        )),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }
}
