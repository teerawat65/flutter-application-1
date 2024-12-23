import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resume App',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const ResumePage(),
    );
  }
}

class ResumePage extends StatelessWidget {
  const ResumePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  'https://scontent-bkk1-2.cdninstagram.com/v/t51.2885-19/467916159_8626673054106375_5499858894143749622_n.jpg?stp=dst-jpg_s150x150_tt6&_nc_ht=scontent-bkk1-2.cdninstagram.com&_nc_cat=103&_nc_ohc=R1MgKF5iH40Q7kNvgFrIe-D&_nc_gid=8c2f07f3ca944ca0a4d7ad40388bf62a&edm=AP4sbd4BAAAA&ccb=7-5&oh=00_AYAfLXFPZD99z-QesY6BVnVuJSS-GtgPK50c1SNavAsrQQ&oe=676EFAB0&_nc_sid=7a9f4b',
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                'Teerawat Areline Bunson',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            const SizedBox(height: 16),
            buildInfoCard(
              title: 'Basic Info',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CustomText('Hobby: Lazy', Colors.black87),
                  CustomText('Food: Pad Thai', Colors.black87),
                  CustomText('Birthplace: Chaiyaphum', Colors.black87),
                ],
              ),
            ),
            const SizedBox(height: 16),
            buildInfoCard(
              title: 'Education',
              content: Column(
                children: const [
                  buildEducationItem(
                      'Elementary', 'Banpatthanasamakee', 2016, Colors.black),
                  buildEducationItem(
                      'Primary', 'Jiangthongpitthayakom', 2019, Colors.black),
                  buildEducationItem(
                      'High School', 'Maeramadwitthayakom', 2022, Colors.black),
                  buildEducationItem('Undergrad', 'Naresuan University', 2025,
                      Colors.black),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoCard({required String title, required Widget content}) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const Divider(
              color: Colors.blueAccent,
              thickness: 1.2,
            ),
            const SizedBox(height: 8),
            content,
          ],
        ),
      ),
    );
  }
}

class buildEducationItem extends StatelessWidget {
  final String level;
  final String name;
  final int year;
  final Color textColor;

  const buildEducationItem(this.level, this.name, this.year, this.textColor,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 3,
            child: Text(
              '$level: $name',
              style: TextStyle(color: textColor, fontSize: 16),
            ),
          ),
          Flexible(
            child: Text(
              'Year: $year',
              style: TextStyle(color: textColor, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String text;
  final Color color;

  const CustomText(this.text, this.color, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Text(
        text,
        style: TextStyle(color: color, fontSize: 16),
      ),
    );
  }
}
