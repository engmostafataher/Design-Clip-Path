import 'package:flutter/material.dart';
import 'package:gauge_chart/gauge_chart.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});
  double width(context) => MediaQuery.of(context).size.width;
  double height(context) => MediaQuery.of(context).size.height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width(context),
      height: height(context),
      child: Stack(children: [
        SizedBox(
          width: width(context),
          height: height(context),
          child: Image.asset(
            'assets/images/xzxz.PNG',
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
            top: 0,
            child: Container(
              width: width(context),
              alignment: Alignment.center,
              child: ClipPath(
                clipper: CustomShapeClipper(),
                child: Container(
                  width: width(context),
                  height: height(context) * .5,
                  color: Colors.white,
                  child: SafeArea(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 32,
                                backgroundImage:
                                    AssetImage('assets/images/cvmostafa.jpg'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Good Day',
                                    style: GoogleFonts.lato(
                                      fontSize: 15,
                                      color: Color.fromARGB(225, 4, 72, 128),
                                    ),
                                  ),
                                  Text(
                                    'Eng Mostafa',
                                    style: GoogleFonts.lato(
                                        fontSize: 20,
                                        color: Color.fromARGB(225, 4, 72, 128),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.bed,
                                        color: Colors.blue,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Sleeping',
                                        style: GoogleFonts.lato(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.run_circle,
                                        color: Colors.pink,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Walking',
                                        style: GoogleFonts.lato(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.bike_scooter,
                                        color: Colors.purple,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Cycling',
                                        style: GoogleFonts.lato(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              GaugeChart(
                                children: [
                                  PieData(
                                      value: 50,
                                      color: Colors.blue,
                                      description: 'description'),
                                  PieData(
                                      value: 30,
                                      color: Colors.pink,
                                      description: 'description'),
                                  PieData(
                                      value: 50,
                                      color: Colors.purple,
                                      description: 'description'),
                                ],
                                gap: 10,
                                start: 100,
                                displayIndex: 3,
                                isHalfChart: false,
                                showValue: false,
                                size: 100,
                                borderWidth: 10,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ))
      ]),
    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width * .5 - 120, size.height - 5)
      ..cubicTo(size.width * .5 - 120, size.height - 5, size.width * .5 - 80,
          size.height - 10, size.width * .5 - 50, size.height - 40)
      ..cubicTo(size.width * .5 - 50, size.height - 40, size.width * .5,
          size.height - 80, size.width * .5 + 50, size.height - 40)
      ..cubicTo(size.width * .5 + 50, size.height - 40, size.width * .5 + 80,
          size.height - 10, size.width * .5 + 120, size.height - 4)
      ..lineTo(size.width * .5 + 120, size.height - 4)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
