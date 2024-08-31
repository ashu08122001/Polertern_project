import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:polertern_project/Screenshot%20and%20Share/share.dart';
import 'package:polertern_project/Success/SuccessScreen.dart';
import 'package:slide_to_act/slide_to_act.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List imageList = [
    {"id": 1, "image_path": 'assets/images/img1.jpg'},
    {"id": 2, "image_path": 'assets/images/img2.jpg'},
    {"id": 3, "image_path": 'assets/images/img3.jpg'}
  ];
  final CarouselSliderController carouselController = CarouselSliderController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;


    bool isSmallScreen = screenWidth < 360;


    double scaleSize(double size) {
      return isSmallScreen ? size * 0.9 : size;
    }


    EdgeInsetsGeometry scalePadding(double left, double right) {
      return isSmallScreen ? EdgeInsets.only(left: left * 0.9, right: right * 0.9) : EdgeInsets.only(left: left, right: right);
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CarouselSlider(
                  items: imageList.map((item) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Image.asset(
                          item['image_path'],
                          fit: BoxFit.cover,
                          width: screenWidth,
                          height: screenHeight * 0.4,
                        );
                      },
                    );
                  }).toList(),
                  carouselController: carouselController,
                  options: CarouselOptions(
                    scrollPhysics: BouncingScrollPhysics(),
                    autoPlay: true,
                    aspectRatio: 12 / 9,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        imageList.length,
                            (index) => buildDot(index),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: scalePadding(screenWidth * 0.03, screenWidth * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Canyon Road Trip",
                      style: TextStyle(
                        fontSize: scaleSize(24),
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Share(),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: scalePadding(screenWidth * 0.03, screenWidth * 0.03),
              child: Row(

                children: [
                  Row(
                    children: [
                      Icon(
                        size: scaleSize(24),
                        color: Colors.black54,
                        Icons.alarm,
                      ),
                      SizedBox(width: scaleSize(8)),
                      Text(
                        "Date and Time",
                        style: TextStyle(
                          fontSize: scaleSize(16),
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: screenWidth*0.13,
                  ),
                  Row(
                    children: [
                      Icon(
                        size: scaleSize(24),
                        color: Colors.black54,
                        Icons.wallet_sharp,
                      ),
                      SizedBox(width: scaleSize(8)),
                      Text(
                        "Cost",
                        style: TextStyle(
                          fontSize: scaleSize(16),
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: scalePadding(screenWidth * 0.03, screenWidth * 0.03),
              child: Row(
                children: [
                  Text(
                    "30th Aug, '23-2:00 AM",
                    style: TextStyle(fontSize: scaleSize(18)),
                  ),
                  SizedBox(width: scaleSize(16)),
                  Text(
                    "₹ 400",
                    style: TextStyle(fontSize: scaleSize(18)),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: scalePadding(screenWidth * 0.03, screenWidth * 0.03),
              child: Row(
                children: [
                  Icon(
                    size: scaleSize(24),
                    color: Colors.black54,
                    Icons.location_on,
                  ),
                  SizedBox(width: scaleSize(8)),
                  Text(
                    "Location",
                    style: TextStyle(
                      fontSize: scaleSize(16),
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: scalePadding(screenWidth * 0.03, screenWidth * 0.03),
              child: Text(
                "Denspasar → Jakarta",
                style: TextStyle(fontSize: scaleSize(18)),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: scalePadding(screenWidth * 0.03, screenWidth * 0.03),
              child: Text(
                "The distance between Denpasar, Bali, and Jakarta,"
                    " Indonesia is approximately 962 km (598 miles)."
                    "From Denpasar, take the Gilimanuk Ferry to Ketapang,"
                    " Banyuwangi, and then continue north on the Java island.",
                style: TextStyle(fontSize: scaleSize(16), color: Colors.black54),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: screenHeight * 0.1),
            Padding(
              padding: scalePadding(screenWidth * 0.03, screenWidth * 0.03),
              child: SlideAction(
                height: screenHeight * 0.08,
                borderRadius: scaleSize(15),
                text: "RSVP'd",
                textStyle: TextStyle(
                  fontSize: scaleSize(18),
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                sliderButtonIconSize: scaleSize(12),
                outerColor: Colors.blueGrey,
                onSubmit: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SuccessScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDot(int index) {
    return Container(
      height: 10,
      width: currentIndex == index ? 18 : 7,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
