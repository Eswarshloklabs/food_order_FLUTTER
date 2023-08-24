import 'package:flutter/material.dart';
import 'package:myflutter/colors.dart';

import 'drawermenu.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final List<String> bannerlist = [
    "assets/frenchfries.png",
    "assets/chicken.png",
    "assets/fruits.png",
    "assets/mixer.png",
    "assets/noodles.png",
  ];

  double translateX = 0.0;

  double translatey = 0.0;

  double scale = 1;

  bool toggle = false;

  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        drawermenu(),
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          transform: Matrix4.translationValues(translateX, translatey, 0)
            ..scale(scale),
          child: ClipRRect(
            borderRadius:
                (toggle) ? BorderRadius.circular(20) : BorderRadius.circular(0),
            child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: AnimatedIcon(
                      icon: AnimatedIcons.menu_arrow,
                      color: Colors.black,
                      progress: _animationController),

                  // icon: Icon(
                  //   Icons.menu,
                  //   color: Colors.black,
                  // ),
                  onPressed: () {
                    toggle = !toggle;
                    if (toggle) {
                      translateX = 200;
                      translatey = 80;
                      scale = 0.8;
                      _animationController.forward();
                    } else {
                      translateX = 0.0;
                      translatey = 0.0;
                      scale = 1;
                      _animationController.reverse();
                    }
                    setState(() {});
                  },
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Delivering to",
                      // style: Theme.of(context).textTheme.subtitle2,
                      style: TextStyle(color: Colors.black45, fontSize: 14),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Current Location",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: primaryColor,
                            size: 30,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 45,
                              margin: EdgeInsets.symmetric(vertical: 5),
                              padding: EdgeInsets.only(left: 5),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Material(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(30),
                                child: InkWell(
                                  onTap: () {},
                                  borderRadius: BorderRadius.circular(25),
                                  child: const Row(
                                    children: [
                                      Image(
                                        image: AssetImage("assets/search.png"),
                                        width: 18,
                                        height: 18,
                                      ),
                                      Text(
                                        "Search Foods",
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              "assets/filter.png",
                              height: 35,
                              width: 30,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      titlewidget(context, "Category"),
                      Container(
                        height: 115,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          // physics: NeverScrollableScrollPhysics(),
                          itemCount: listcards.length,
                          itemBuilder: (context, index) {
                            return categorycard(
                                categorymodel: listcards[index]);
                          },
                        ),
                      ),
                      titlewidget(context, "Popular"),
                      ////
                      for (int i = 0; i < bannerlist.length; i++) ...{
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 5,
                                spreadRadius: 10,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  height: 220,
                                  margin: const EdgeInsets.only(bottom: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(bannerlist[i]),
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Food Product Name",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: primaryColor,
                                    ),
                                    Text(
                                      "4.5",
                                      style: TextStyle(color: primaryColor),
                                    ),
                                    Text("(128 ratings)"),
                                    Spacer(),
                                    Text("Cafe Western Food"),
                                    Text("\$5")
                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                            ],
                          ),
                        ),
                      }
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget titlewidget(BuildContext context, String title) {
    return Text(
      title,
      style: TextStyle(
          color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold),
    );
  }
}

class categorycard extends StatelessWidget {
  final categorymodel;

  categorycard({required this.categorymodel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.only(top: 5, bottom: 2, right: 5, left: 8),
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.green.withOpacity(0.3),
          ),
          child: Image.asset(categorymodel.imageurl),
        ),
        Text(
          categorymodel.title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}

class categorymodel {
  String imageurl, title;
  categorymodel({
    required this.imageurl,
    required this.title,
  });
}

List<categorymodel> listcards = [
  categorymodel(imageurl: "assets/offers.png", title: "Offers"),
  categorymodel(imageurl: "assets/burger.png", title: "Burger"),
  categorymodel(imageurl: "assets/pizza.png", title: "Pizza"),
  categorymodel(imageurl: "assets/asian.png", title: "Asian"),
  categorymodel(imageurl: "assets/drink.png", title: "Drinks"),
];
