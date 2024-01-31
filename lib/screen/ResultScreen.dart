import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ResultScreen extends StatelessWidget {
  final int eng, urd, math, sci, isl, obt;
  final double per;
  final String grd;

  ResultScreen({
    Key? key,
    required this.eng,
    required this.urd,
    required this.math,
    required this.sci,
    required this.isl,
    required this.obt,
    required this.per,
    required this.grd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 170, 193, 232),
      ),
      body: Container(
         decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Color(0xFF45B6FE), // Adjust color codes as needed
              Color(0xFF3981D9),
              Colors.indigo,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildResultCard('English', eng),
              buildResultCard('Urdu', urd),
              buildResultCard('Math', math),
              buildResultCard('Science', sci),
              buildResultCard('Islamiat', isl),
              const Gap(30),
              buildTotalMarksCard(),
              const Gap(20),
              buildObtainedMarksCard(obt),
              buildPercentageCard(per),
              buildGradeCard(grd),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildResultCard(String subject, int marks) {
    return Container(
       decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.blueAccent,
              Colors.indigo,
            ],
          ),
        ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            '$subject: $marks',
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
    );
  }

  Widget buildTotalMarksCard() {
    return Card(
      child: Container(
         decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Color(0xFF45B6FE), // Adjust color codes as needed
              Color(0xFF3981D9),
              Colors.indigo,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Total Marks: 500',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
    );
  }

  Widget buildObtainedMarksCard(int obtainedMarks) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Obtained Marks: $obtainedMarks',
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }

  Widget buildPercentageCard(double percentage) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Percentage: ${percentage.toStringAsFixed(2)}%',
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }

  Widget buildGradeCard(String grade) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Grade: $grade',
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }
}
