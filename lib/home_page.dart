import 'dart:math';
import 'dart:io';

import 'package:mini_project/detail_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'balance.dart';
import 'front_card.dart';
import 'credit_card.dart';
import 'home_header.dart';
import 'package:flutter/material.dart';

import 'package:mini_project/size_config.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  PageController pageController = PageController(viewportFraction: 0.6);
  int _previousIndex = 0;
  int _currentIndex = 0;
  Key? key;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            exit(0);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeHeader(),
            Balance(
              previousIndex: _previousIndex,
              currentIndex: _currentIndex,
            ),
            _buildCardsList(),
            _buildPageIndicator(),
          ],
        ),
      ),
    );
  }

  _buildPageIndicator() => Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.defaultWidth * 2,
            vertical: SizeConfig.defaultHeight * 2),
        child: SmoothPageIndicator(
          controller: pageController,
          count: cards.length,
          effect: WormEffect(
              dotHeight: SizeConfig.defaultHeight,
              dotWidth: SizeConfig.defaultHeight,
              activeDotColor: Colors.white),
        ),
      );

  _buildCardsList() => Expanded(
          child: Transform(
        transform: Matrix4.identity()
          ..translate(-SizeConfig.defaultWidth * 4)
          ..rotateZ(-pi / 2),
        alignment: Alignment.center,
        child: PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: cards.length,
            controller: pageController,
            onPageChanged: (index) => setState(() {
                  _previousIndex = _currentIndex;
                  _currentIndex = index;
                }),
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPage(
                                card: cards[index],
                                key: null,
                              ))),
                  child: Container(
                    padding:
                        EdgeInsets.only(bottom: SizeConfig.defaultHeight * 5),
                    child: FrontCard(
                      card: cards[index],
                    ),
                  ));
            }),
      ));
}
