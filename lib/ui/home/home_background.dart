import 'package:flutter/material.dart';

class HomeBackground extends StatelessWidget {
  final screenHeight;

  const HomeBackground({Key key, @required this.screenHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themedata = Theme.of(context);

    return ClipPath(
      clipper: BottomShapeClipper(),
      child: Container(
        color: themedata.primaryColor,
        height: screenHeight * 0.5,
      ),
    );
  }
}


class BottomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) { 
    Path path = Path();
    Offset curveStartPoint = Offset(0, size.height * 0.85);
    Offset curveEndPoint = Offset(size.width, size.height * 0.85);
    path.lineTo(curveStartPoint.dx, curveEndPoint.dy);
    path.quadraticBezierTo(size.width/2, size.height, curveEndPoint.dx, curveEndPoint.dy);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

}