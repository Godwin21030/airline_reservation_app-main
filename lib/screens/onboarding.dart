import 'package:airline_reservation_app/models/onboarding.dart';
import 'package:airline_reservation_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<StatefulWidget> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  Widget buildDots(int index) {
    return Stack(
      children: [
        Container(
          height: 25,
          width: 25,
          decoration: _currentIndex == index
              ? BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(50))
              : null,
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: _currentIndex == index
                    ? Theme.of(context).primaryColor
                    : Colors.grey[350],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 50,
              width: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  content.length,
                  (index) => buildDots(index),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                  controller: _controller,
                  onPageChanged: (int index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemCount: content.length,
                  itemBuilder: ((BuildContext context, int index) => Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                content[index].svgPath.toString(),
                                height: 300,
                              ),
                              Text(
                                content[index].title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 40),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                content[index].description,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.black45,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ))),
            ),
            Container(
                height: 55,
                width: double.infinity,
                margin: const EdgeInsets.all(40.0),
                child: const CustomButton(
                  text: "Get Started",
                  route: '/home',
                ))
          ],
        ),
      ),
    );
  }
}
