import 'package:farm/views/MenuPage/HistoricoCalculoPage/HistoricoCalculoScreen.dart';
import 'package:farm/views/MenuPage/homePage/HomeScreen.dart';
import 'package:flutter/material.dart';

class NaviBar extends StatefulWidget {
  @override
  NaviBarState createState() => NaviBarState();
}

class NaviBarState extends State<NaviBar> {
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Scaffold(
          bottomNavigationBar: Container(
            // margin: EdgeInsets.symmetric(
            //   horizontal: displayWidth * .23,
            //   vertical: displayWidth * .03,
            // ),
            margin: EdgeInsets.only(
              left: displayWidth * .23,
              right: displayWidth * .23,
              bottom: displayWidth * .04,
            ),
            // margin: EdgeInsets.only(
            //   left: 95,
            //   right: 95,
            //   bottom: 17,
            // ),
            height: displayWidth * .155,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 0, 0, 0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 30,
                  offset: Offset(0, 10),
                ),
              ],
              borderRadius: BorderRadius.circular(50),
            ),
            child: ListView.builder(
              itemCount: 2,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: displayWidth * .02),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  setState(() {
                    currentIndex = index;
                  });
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Stack(
                  children: [
                    AnimatedContainer(
                      duration: Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      width: index == currentIndex
                          ? displayWidth * .32
                          : displayWidth * .18,
                      alignment: Alignment.center,
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        curve: Curves.fastLinearToSlowEaseIn,
                        height: index == currentIndex ? displayWidth * .12 : 0,
                        width: index == currentIndex ? displayWidth * .32 : 0,
                        decoration: BoxDecoration(
                          color: index == currentIndex
                              ? Colors.grey.withOpacity(.3)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      width: index == currentIndex
                          ? displayWidth * .31
                          : displayWidth * .18,
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          Row(
                            children: [
                              AnimatedContainer(
                                duration: Duration(seconds: 1),
                                curve: Curves.fastLinearToSlowEaseIn,
                                width: index == currentIndex
                                    ? displayWidth * .13
                                    : 0,
                              ),
                              AnimatedOpacity(
                                opacity: index == currentIndex ? 1 : 0,
                                duration: Duration(seconds: 1),
                                curve: Curves.fastLinearToSlowEaseIn,
                                child: Text(
                                  index == currentIndex
                                      ? '${listOfStrings[index]}'
                                      : '',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              AnimatedContainer(
                                duration: Duration(seconds: 1),
                                curve: Curves.fastLinearToSlowEaseIn,
                                width: index == currentIndex
                                    ? displayWidth * .03
                                    : 20,
                              ),
                              Icon(
                                listOfIcons[index],
                                size: displayWidth * .076,
                                color: index == currentIndex
                                    ? Colors.white
                                    : Colors.grey,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: IndexedStack(
            index: currentIndex,
            children: [
              HomeScreen(),
              HistoricoCalculoScreen(),
            ],
          ),
        ),
      ],
    );
  }

  List<IconData> listOfIcons = [
    Icons.home,
    Icons.agriculture,
  ];

  List<String> listOfStrings = [
    'Início',
    'Histórico',
  ];
}
