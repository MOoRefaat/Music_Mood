import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:music_mood/Welcome_Screen/welcome_screen.dart';
import 'package:music_mood/components/components.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BordingModel {
  String? image;
  String? title;

  BordingModel({
    required this.image,
    required this.title,
  });
}

class OnBordingScreen extends StatefulWidget {
  // const OnBordingScreen({Key? key}) : super(key: key);

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  var boardController = PageController();

  List<BordingModel> bording = [
    BordingModel(
      image: 'assets/images/1.png',
      title: 'Listen To Your Favorite Music.',
    ),
    BordingModel(
      image: 'assets/images/2.png',
      title: 'Enjoy Your Music On Your Mood.',
    ),
    BordingModel(
      image: 'assets/images/3.png',
      title: 'Now Get In And Let The Fun Begins!',
    ),
  ];
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {
                navigateTo(context, WelcomeScreen());
              },
              child: Text(
                'SKIP',
                style: TextStyle(color: HexColor('#7D4EFF')),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
                child: PageView.builder(
              controller: boardController,
              physics: BouncingScrollPhysics(),
              onPageChanged: (int index) {
                if (index == bording.length - 1) {
                  setState(() {
                    isLast = true;
                  });
                  print('last');
                } else {
                  setState(() {
                    isLast = false;
                  });
                  print('Not Last');
                }
              },
              itemBuilder: (context, index) => buildBordingItem(bording[index]),
              itemCount: bording.length,
            )),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: bording.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: HexColor('#7D4EFF'),
                    dotHeight: 15,
                    expansionFactor: 3,
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                  backgroundColor: HexColor('#7D4EFF'),
                  onPressed: () {
                    if (isLast) {
                      navigateTo(context, WelcomeScreen());
                    } else {
                      boardController.nextPage(
                          duration: Duration(microseconds: 600),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  child: Icon(Icons.arrow_forward),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildBordingItem(BordingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                // CircleAvatar(
                //   radius: 200,
                //   backgroundColor: HexColor('#7D4EFF'),
                // ),
                CircleAvatar(
                    radius: 200,
                    child: Image(image: AssetImage('${model.image}'))),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text(
            '${model.title}',
            style: TextStyle(
              fontSize: 62,
              fontFamily: 'Work Sans',
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 40),
        ],
      );
}
