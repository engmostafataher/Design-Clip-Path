import 'dart:math';

import 'package:flutter/material.dart';

class HabitScreen extends StatefulWidget {
  @override
  State<HabitScreen> createState() => _HabitScreenState();
}

class _HabitScreenState extends State<HabitScreen> {
  double _currentSliderValue = 5.0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Custom Clipped Header
          ClipPath(
            clipper: HeaderClipper(),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/xzxz.PNG')),
                gradient: LinearGradient(
                  colors: [Colors.white, Colors.white],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Text(
                  'Add Habit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          // Main Form Content
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Habit Title"),
                SizedBox(height: 5),
                TextFormField(
                  keyboardType: TextInputType.none,
                  decoration: InputDecoration(
                    hintText: "Enter Habit Title",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 5),
                Text("Choose an Activity"),
                // SizedBox(height: 10),
                // Grid of Icons
                GridView.count(
                  crossAxisCount: 4,
                  shrinkWrap: true,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: List.generate(8, (index) {
                    return GestureDetector(
                      child: CircleAvatar(
                        backgroundColor:
                            index == 2 ? Colors.blue : Colors.grey[200],
                        child: Icon(Icons.accessibility, color: Colors.white),
                      ),
                    );
                  }),
                ),
                // SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Select a goal"),
                    Text("5.0"),
                  ],
                ),
                Slider(
                  value: _currentSliderValue,
            min: 0,
            max: 10,
            divisions: 10, // Optional: makes it a discrete slider
            label: _currentSliderValue.toStringAsFixed(1),
                  onChanged: (value) {
                  
                    setState(() {
                    _currentSliderValue = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Add Habit"),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: Colors.blue,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 40);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
