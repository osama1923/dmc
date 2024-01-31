
import 'package:dmc/screen/ResultScreen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late int eng, urdu, math, sci, isl;
  late int obt;
  late String grd;
  late double per;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'DMC',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.black87,
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
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter English marks',
                    labelText: 'English',
                  ),
                  validator: (text) => validateMarks(text),
                  onChanged: (value) => eng = int.tryParse(value) ?? 0,
                ),
                const Gap(16),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter Urdu marks',
                    labelText: 'Urdu',
                  ),
                  validator: (text) => validateMarks(text),
                  onChanged: (value) => urdu = int.tryParse(value) ?? 0,
                ),
                const Gap(16),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter Math marks',
                    labelText: 'Math',
                  ),
                  validator: (text) => validateMarks(text),
                  onChanged: (value) => math = int.tryParse(value) ?? 0,
                ),
                const Gap(16),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter Science marks',
                    labelText: 'Science',
                  ),
                  validator: (text) => validateMarks(text),
                  onChanged: (value) => sci = int.tryParse(value) ?? 0,
                ),
                const Gap(16),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter Islamiat marks',
                    labelText: 'Islamiat',
                  ),
                  validator: (text) => validateMarks(text),
                  onChanged: (value) => isl = int.tryParse(value) ?? 0,
                ),
                const Gap(20),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        calculateResult();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ResultScreen(
                              eng: eng,
                              urd: urdu,
                              math: math,
                              sci: sci,
                              isl: isl,
                              obt: obt,
                              per: per,
                              grd: grd,
                            ),
                          ),
                        );
                      });
                    }
                  },
                  child: const Text('Calculate'),
                ),
                const Gap(20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      formKey.currentState!.reset();
                    });
                  },
                  child: const Text('Clear'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? validateMarks(String? text) {
    if (text == null || text.isEmpty) {
      return 'Please enter marks';
    }
    if (text.length > 3 || int.tryParse(text) == null || int.parse(text) < 0 || int.parse(text) > 100) {
      return 'Invalid Marks';
    }
    return null;
  }

  void calculateResult() {
    obt = eng + urdu + math + sci + isl;
    per = obt * 100 / 500;
    if (per >= 90) {
      grd = 'A';
    } else if (per >= 80) {
      grd = 'B';
    } else if (per >= 70) {
      grd = 'C';
    } else if (per >= 60) {
      grd = 'D';
    } else {
      grd = 'Fail';
    }
  }
}
