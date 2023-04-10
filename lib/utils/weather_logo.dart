import 'package:flutter/material.dart';

class WeatherLogo extends CustomPainter {
  final double weahter;

  WeatherLogo(this.weahter);

  @override
  void paint(Canvas canvas, Size size) {
    final paintSun = Paint()
      ..color = Colors.yellow.withOpacity(_getSunOpacity())
      ..style = PaintingStyle.fill;

    final paintCloud = Paint()
      ..color =
          const Color.fromARGB(255, 36, 36, 36).withOpacity(_getCloudOpacity())
      ..style = PaintingStyle.fill;

    final paintDrops = Paint()
      ..color = Colors.blue.withOpacity(_getDropsOpacity())
      ..style = PaintingStyle.fill;

    final centerX = size.width / 2;
    final centerY = size.height / 3;
    final radius = size.width / 3;

    canvas.drawCircle(Offset(centerX, centerY), radius, paintSun);

    Path cloudPath = Path();
    cloudPath.moveTo(size.width * 0.1300000, size.height * 0.7325000);
    cloudPath.lineTo(size.width * 0.7725000, size.height * 0.7300000);
    cloudPath.quadraticBezierTo(size.width * 0.9381000, size.height * 0.7169000,
        size.width * 0.9675000, size.height * 0.6150000);
    cloudPath.quadraticBezierTo(size.width * 0.9344000, size.height * 0.5081000,
        size.width * 0.8050000, size.height * 0.4950000);
    cloudPath.quadraticBezierTo(size.width * 0.6388000, size.height * 0.4969000,
        size.width * 0.5875000, size.height * 0.4975000);
    cloudPath.cubicTo(
        size.width * 0.6250000,
        size.height * 0.4581000,
        size.width * 0.6500000,
        size.height * 0.4044000,
        size.width * 0.6525000,
        size.height * 0.3625000);
    cloudPath.cubicTo(
        size.width * 0.6350000,
        size.height * 0.2575000,
        size.width * 0.4863000,
        size.height * 0.2763000,
        size.width * 0.4375000,
        size.height * 0.3375000);
    cloudPath.quadraticBezierTo(size.width * 0.4156250, size.height * 0.3781250,
        size.width * 0.2775000, size.height * 0.4975000);
    cloudPath.lineTo(size.width * 0.1100000, size.height * 0.5000000);
    cloudPath.quadraticBezierTo(size.width * 0.0125000, size.height * 0.5275000,
        size.width * 0.0050000, size.height * 0.6225000);
    cloudPath.quadraticBezierTo(size.width * 0.0200000, size.height * 0.7256000,
        size.width * 0.1300000, size.height * 0.7325000);
    cloudPath.close();

    canvas.drawPath(cloudPath, paintCloud);

    Path dropsPath = Path();
    dropsPath.moveTo(size.width * 0.2400000, size.height * 0.7500000);
    dropsPath.lineTo(size.width * 0.1600000, size.height * 0.9200000);
    dropsPath.lineTo(size.width * 0.1760000, size.height * 0.9270000);
    dropsPath.lineTo(size.width * 0.2602000, size.height * 0.7530000);
    dropsPath.lineTo(size.width * 0.2400000, size.height * 0.7500000);
    dropsPath.moveTo(size.width * 0.5242000, size.height * 0.7500000);
    dropsPath.lineTo(size.width * 0.4442000, size.height * 0.9200000);
    dropsPath.lineTo(size.width * 0.4602000, size.height * 0.9270000);
    dropsPath.lineTo(size.width * 0.5444000, size.height * 0.7530000);
    dropsPath.lineTo(size.width * 0.5242000, size.height * 0.7500000);
    dropsPath.moveTo(size.width * 0.8126000, size.height * 0.7444000);
    dropsPath.lineTo(size.width * 0.7326000, size.height * 0.9144000);
    dropsPath.lineTo(size.width * 0.7486000, size.height * 0.9214000);
    dropsPath.lineTo(size.width * 0.8328000, size.height * 0.7474000);
    dropsPath.lineTo(size.width * 0.8126000, size.height * 0.7444000);
    dropsPath.close();

    canvas.drawPath(dropsPath, paintDrops);
  }

  @override
  bool shouldRepaint(covariant WeatherLogo oldDelegate) {
    return oldDelegate.weahter != weahter;
  }

  double _getSunOpacity() {
    if (weahter > 0.7) {
      return 0;
    }

    return -10 / 7 * weahter + 1;
  }

  double _getCloudOpacity() {
    if (weahter < 0.5) {
      return 0;
    }

    return 10 / 6 * weahter - 4 / 6;
  }

  double _getDropsOpacity() {
    if (weahter < 0.7) {
      return 0;
    }

    return 10 / 3 * weahter - 7 / 3;
  }
}
