import 'package:flutter/material.dart';
import 'package:hng_task3/utils/assets/assets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
          ..scale(isDrawerOpen ? 0.50 : 1.00)
          ..rotateZ(isDrawerOpen ? 0 : 0),
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: isDrawerOpen
              ? BorderRadius.circular(40)
              : BorderRadius.circular(0),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    isDrawerOpen
                        ? GestureDetector(
                            child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(Assets.homeimage)),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.red,
                                      blurRadius: 4,
                                      offset:
                                          Offset(-100, -8), // Shadow position
                                    ),
                                  ]),
                              child: const Text("Hello World"),
                            ),
                            onTap: () {
                              setState(() {
                                xOffset = 0;
                                yOffset = 0;
                                isDrawerOpen = false;
                              });
                            },
                          )
                        : GestureDetector(
                            child: const Icon(Icons.menu),
                            onTap: () {
                              setState(() {
                                xOffset = 170;
                                yOffset = 150;
                                isDrawerOpen = true;
                              });
                            },
                          ),

                    // Container(
                    //   height: 20,
                    //   width: 30,
                    //   decoration: BoxDecoration(
                    //       image: DecorationImage(
                    //           image: AssetImage(Assets.homeimage))),
                    // ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Column(children: <Widget>[])
            ],
          ),
        ),
      ),
    );
  }
}

class NewPadding extends StatelessWidget {
  final String image1;
  final String text1;
  final String image2;
  final String text2;

  const NewPadding({
    super.key,
    required this.image1,
    required this.text1,
    required this.image2,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Image(
                    height: 100,
                    width: 100,
                    image: AssetImage(image1),
                  ),
                ),
                Text(
                  text1,
                  style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 15,
                      decoration: TextDecoration.none),
                )
              ],
            ),
          ),
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Image(
                    height: 100,
                    width: 100,
                    image: AssetImage(image2),
                  ),
                ),
                Text(
                  text2,
                  style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 15,
                      decoration: TextDecoration.none),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
