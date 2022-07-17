import 'splash_data.dart';

import 'splash_screen_list_content_renderer.dart';
import 'start_button_renderer.dart';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ConstellationListView extends StatefulWidget {
  static const route = "ConstellationListView";

  final List<ConstellationData> constellations;
  final void Function(double) onScrolled;
  final void Function(ConstellationData, bool) onItemTap;

  final List<SplashContentData> splashData;
  final void Function(double) onScrolledSplashScreen;

  const ConstellationListView(
      {Key key,
      this.onScrolled,
      this.onItemTap,
      @required this.constellations,
      @required this.splashData,
      this.onScrolledSplashScreen})
      : super(key: key);

  @override
  _ConstellationListViewState createState() => _ConstellationListViewState();
}

class _ConstellationListViewState extends State<ConstellationListView> {
  double _prevScrollPos = 0;
  double _scrollVel = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    //Build list using data
    return Align(
      child: Container(
        width: 700,
        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: 0,
              child: SizedBox(
                height: 500,
                width: 700,
                child: _buildScrollingList2(),
              ),
            ),

            Positioned(
              bottom: 400,
              left: 150,
              child: _buildPageIndicators(),
            ),
            Positioned(
              bottom: 100,
              left: 120,
              child: _buildScrollingList(),
            ),

            //Cover the list with black gradients on top & bottom
            _buildGradientOverlay(),
          ],
        ),
      ),
    );
  }

  Container _buildScrollingList2() {
    var data = widget.splashData;

    return Container(
      //Wrap list in a NotificationListener, so we can detect scroll updates
      child: NotificationListener<ScrollNotification>(
        onNotification: _handleScrollNotification,
        child: PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            //Create the list renderer, injecting it with some ConstellationData
            return Splash_Content(
              //Re-dispatch our tap event to anyone who is listening
              // onTap: widget.onItemTap,

              data: data[index],
            );
          },
        ),
      ),
    );
  }

  Widget _buildPageIndicators() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: ExpandingDotsEffect(
                spacing: 2.0,
                radius: 4.0,
                dotWidth: 12.0,
                dotHeight: 6.0,
                paintStyle: PaintingStyle.fill,
                strokeWidth: 0.5,
                dotColor: Color(0xFFD8D8D8),
                activeDotColor: Color(0xFF47c3d4),
              ),
              onDotClicked: (index) => _pageController.animateToPage(index,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInCubic),
            ),
          ),
        )
      ],
    );
  }

  Container _buildScrollingList() {
    var data = widget.constellations;

    return Container(
      child: ConstellationListRenderer(
        data: data[0],
        //Re-dispatch our tap event to anyone who is listening
        onTap: widget.onItemTap,
      ),
    );
  }

  Widget _buildGradientOverlay() {
    double firstGradientStop = .2;
    return IgnorePointer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.transparent,
            Color(0x0),
            Color(0x0),
            Colors.black
          ], stops: [
            0,
            firstGradientStop,
            1 - firstGradientStop,
            1
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
      ),
    );
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    //Determine scrollVelocity and dispatch it to any listeners
    _scrollVel = notification.metrics.pixels - _prevScrollPos;
    if (widget.onScrolled != null) {
      widget.onScrolled(_scrollVel);
    }
    //print(notification.metrics.pixels - _prevScroll);
    _prevScrollPos = notification.metrics.pixels;
    //Return true to cancel the notification bubbling, we've handled it here.
    return true;
  }
}
