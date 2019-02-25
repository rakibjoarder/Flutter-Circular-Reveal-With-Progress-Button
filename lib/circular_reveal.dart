import 'package:flutter/material.dart';
import 'package:flutter_circular_reveal/reveal_painter.dart';
import 'package:flutter_circular_reveal/progress_button.dart';
import 'package:flutter_circular_reveal/first_page.dart';
class CircularReveal extends StatefulWidget {
  @override
  _CircularRevealState createState() => _CircularRevealState();
}

class _CircularRevealState extends State<CircularReveal> with TickerProviderStateMixin {

  AnimationController _controller;
  Animation<double>  _animation ;
  double fraction = 0.0;

  void reveal(){
    _controller = new AnimationController(vsync: this,duration: Duration(milliseconds: 300));
    _animation = Tween(begin: 0.0,end: 1.0)
      .animate(_controller)
       ..addListener((){
        setState(() {
          fraction = _controller.value;
        });
      }) ..addStatusListener((AnimationStatus state) {
        if (state == AnimationStatus.completed) {
         Navigator.of(context).push(MaterialPageRoute(builder: (context) => new FirstPage()));
        }
      });

    _controller.forward();

  }

  @override
  void deactivate() {
    reset();
    super.deactivate();
  }

  void reset() {
    fraction = 0.0;
  }

  
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RevealPainter(fraction, MediaQuery.of(context).size),
      child: ProgressButton(reveal),
    );
  }
}
