import 'package:example_designer2/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width(context) => MediaQuery.of(context).size.width;
    double height(context) => MediaQuery.of(context).size.height;
    return SizedBox(
      width: width(context),
      height: height(context),
      child: Stack(
        children: [
          SizedBox(
            width: width(context),
            height: height(context) * .6,
            child: Image.asset(
              'assets/images/xzxz.PNG',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: width(context),
            height: height(context) * .8,
            child: Transform.rotate(
                angle: -.5,
                child: Image.asset(
                  'assets/images/zzz.png',
                )),
          ),
          Positioned(
              top: height(context) * .5,
              child: Container(
                alignment: Alignment.center,
                width: width(context),
                child: RotatedBox(
                  quarterTurns: 2,
                  child: ClipPath(
                      clipper: OutSideCustomShapeClipper(),
                      child: Container(
                        width: width(context) * .6,
                        height: height(context) * .55,
                        color: Colors.white,
                      )),
                ),
              )),
          Positioned(
            bottom: 0,
            child: Container(
              width: width(context),
              height: height(context) * .4,
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Maintain Daily Happit',
                    style: GoogleFonts.lato(
                        fontSize: 25,
                        color: Color.fromARGB(225, 4, 72, 128),
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      'A habbit is simple way to messure when you did a habbit the most baisc format is to get a calender',
                      style: GoogleFonts.lato(
                          fontSize: 15,
                          color: Color.fromARGB(225, 139, 138, 138)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SecondScreen()));
                    },
                    child: Stack(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox(
                            height: 60,
                            width: 200,
                            child: Image.asset(
                              'assets/images/xzxz.PNG',
                              fit: BoxFit.cover,
                            )),
                      ),
                      Container(
                        width: 200,
                        height: 60,
                        alignment: Alignment.center,
                        child: Text(
                          'Get Started',
                          style: GoogleFonts.lato(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ]),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class OutSideCustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height * 0.75);
    path.quadraticBezierTo(
        size.width * 0.5, size.height, size.width, size.height * 0.75);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
