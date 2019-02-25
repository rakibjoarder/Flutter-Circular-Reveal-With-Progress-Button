import 'package:flutter/material.dart';
import 'dart:async';

class ProgressButton extends StatefulWidget {
  Function callback;
  ProgressButton(this.callback);
  @override
  _ProgressButtonState createState() => _ProgressButtonState();
}

class _ProgressButtonState extends State<ProgressButton> with TickerProviderStateMixin {

  AnimationController controller;
  Animation<double> animation ;
  var globalKey = new GlobalKey();
  double width = double.infinity;
  bool _isPressed = false,isRevealed = false;
  int state = 0;

  void animateButton() {

    double initialWidth = globalKey.currentContext.size.width;

    controller = new AnimationController(duration: Duration(milliseconds: 1000),vsync: this);
      animation = Tween(begin: 0.0, end: 1.0).animate(controller)
          ..addListener(() {
                setState(() {
              width = initialWidth - ((initialWidth - 48.0) * animation.value);
           });
      });

      controller.forward();

      setState(() {
        state = 1;
      });

      Timer(Duration(milliseconds: 3000),(){
        setState(() {
          state = 2;
        });
      });

    Timer(Duration(milliseconds: 3600),(){
      setState(() {
        isRevealed = true;
        widget.callback();
      });
    });
  }

  @override
  void deactivate() {
    reset();
    super.deactivate();
  }

  void reset() {
    width = double.infinity;
    isRevealed =false;
    state=0;
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: globalKey,
      width: width,
      height: 40,
      child: RaisedButton(
        padding: EdgeInsets.all(0.0),
        color: state == 1 ? Colors.blue : (state == 0 ? Colors.blue : Colors.red),
        elevation:getElevation(),
        child: getButtonChild(),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        onPressed: (){},
        onHighlightChanged: (isPressed){
          _isPressed =isPressed;
          setState(() {
           if(state == 0){
             animateButton();
           }
          });
        },
      ),
    );
  }

  Widget getButtonChild(){
   if(state == 0){
     return Text("Click here",style: TextStyle(color: Colors.white),);
   }else if(state == 1){
     return SizedBox(
       width: 30,
       height: 30,
       child: CircularProgressIndicator(
         valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
       ),
     );
   }else if (state == 2){
     return Icon(Icons.done,color: Colors.white,);
   }
  }

  double  getElevation(){
    if(isRevealed){
      return 0;
    }else{
      return _isPressed ? 6.0 : 4.0;
    }
  }


}
