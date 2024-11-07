import 'package:flutter/material.dart';
import 'package:sample/core/config/config.dart';

spaceHeight(height) => SizedBox(height: double.parse(height.toString()));

spaceWidth(width) => SizedBox(width: double.parse(width.toString()));

sH(context) => MediaQuery.of(context).size.height;

sW(context) => MediaQuery.of(context).size.width;

Center loading() {
  return const Center(
    child: CircularProgressIndicator(
        color: baseClr,
        ),
  );
}

error(String error) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.error_outline,
          color: redClr,
          size: 50,
        ),
        spaceHeight(10),
        Text(error)
      ],
    ),
  );
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
