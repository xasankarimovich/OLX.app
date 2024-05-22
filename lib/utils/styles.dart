
import 'package:flutter/material.dart';

//////////////////////////////////////////////////////////////////
extension IntExtensions on int {
  Widget height() {
    return SizedBox(
      height: toDouble(),
    );
  }
///////////////////////////////////////////////////////////
  Widget width() {
    return SizedBox(
      width: toDouble(),
    );
  }
}
////////////////////////////////////////////////////////////////
extension ContextExtesions on BuildContext {
  double width() {
    return MediaQuery.sizeOf(this).width;
  }
}

///\/\/\/\/\/\/\/\/\/\/\/\/\//\//\/\/\/\/\/\/\/\/\/\
class AppTextStyles {
  static const TextStyle HeadLineblack = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w900,
    color: Color(
      0xFF1A202C,
    ),
  );
  ///////////////////////////////////////////////////////
  static const HeadLinebWhite = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w900,
    color: Colors.white,
  );
  ////////////////////////////////////////////

  static const ParagraphbWhite = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  ///////////////////////////////////////////
  static const Paragraphblack = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w900,
    color:Colors.black45,
  );
}
/////////////////////////////////////////////////////////////////////
abstract class AppDecorationsContainer {
  static const decorContainer = BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(20),

      ),
      // boxShadow: [
      //   BoxShadow(
      //     blurRadius: 1,
      //   ),
      // ],
      color: Colors.blue);


  ////////////////////////////////////////////////////////////////
  static const ContainerDecorshadow = BoxDecoration(
    borderRadius: BorderRadius.all(
      Radius.circular(20),
    ),
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 10,
        spreadRadius: 5,
      ),
    ],
  );
}
