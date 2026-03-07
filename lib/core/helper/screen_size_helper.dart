import 'package:flutter/material.dart';

class ScreenHelper {
  // Private constructor to prevent instantiation
  ScreenHelper._();

  // Get screen size
  static Size getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  // Get screen height
  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  // Get screen width
  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  // Get height percentage (e.g., 0.5 for 50%)
  static double heightPercent(BuildContext context, double percentage) {
    return getHeight(context) * percentage;
  }

  // Get width percentage (e.g., 0.5 for 50%)
  static double widthPercent(BuildContext context, double percentage) {
    return getWidth(context) * percentage;
  }

  // Get dynamic height based on design size (e.g., from Figma)
  static double dynamicHeight(BuildContext context, double designHeight) {
    // Assuming design was made for 812 height (iPhone X)
    const double designBaseHeight = 12.0;
    return (getHeight(context) / designBaseHeight) * designHeight;
  }

  // Get dynamic width based on design size (e.g., from Figma)
  static double dynamicWidth(BuildContext context, double designWidth) {
    // Assuming design was made for 375 width (iPhone X)
    const double designBaseWidth = 12.0;
    return (getWidth(context) / designBaseWidth) * designWidth;
  }

  // Get safe area top padding
  static double getSafeAreaTop(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  // Get safe area bottom padding
  static double getSafeAreaBottom(BuildContext context) {
    return MediaQuery.of(context).padding.bottom;
  }

  // Get safe area height (excluding status bar and notch)
  static double getSafeHeight(BuildContext context) {
    return getHeight(context) - getSafeAreaTop(context) - getSafeAreaBottom(context);
  }

  // Get safe area width (excluding left/right padding)
  static double getSafeWidth(BuildContext context) {
    return getWidth(context) -
        MediaQuery.of(context).padding.left -
        MediaQuery.of(context).padding.right;
  }

  // Get app bar height (default 56)
  static double getAppBarHeight() {
    return kToolbarHeight;
  }

  // Get bottom navigation bar height (default 56)
  static double getBottomNavHeight() {
    return kBottomNavigationBarHeight;
  }

  // Check if device is tablet (width > 600)
  static bool isTablet(BuildContext context) {
    return getWidth(context) > 600;
  }

  // Check if device is landscape
  static bool isLandscape(BuildContext context) {
    return getWidth(context) > getHeight(context);
  }

  // Check if device is portrait
  static bool isPortrait(BuildContext context) {
    return getHeight(context) > getWidth(context);
  }

  // Get responsive font size
  static double getFontSize(BuildContext context, double baseSize) {
    // Scale font based on screen width
    return getWidth(context) * (baseSize / 375); // 375 is base width
  }

  // Get responsive padding
  static EdgeInsets getResponsivePadding(BuildContext context) {
    double padding = isTablet(context) ? 24.0 : 16.0;
    return EdgeInsets.all(padding);
  }

  // Get grid cross axis count based on screen size
  static int getGridCrossAxisCount(BuildContext context) {
    if (isTablet(context)) {
      return isLandscape(context) ? 4 : 3;
    } else {
      return isLandscape(context) ? 3 : 2;
    }
  }

  // Get device type as string
  static String getDeviceType(BuildContext context) {
    if (isTablet(context)) {
      return 'Tablet';
    } else {
      return 'Phone';
    }
  }

  // Get screen orientation as string
  static String getOrientation(BuildContext context) {
    return isLandscape(context) ? 'Landscape' : 'Portrait';
  }

  // Print all screen info (for debugging)
  static void printScreenInfo(BuildContext context) {
    debugPrint('=== Screen Info ===');
    debugPrint('Height: ${getHeight(context)}');
    debugPrint('Width: ${getWidth(context)}');
    debugPrint('Safe Area Top: ${getSafeAreaTop(context)}');
    debugPrint('Safe Area Bottom: ${getSafeAreaBottom(context)}');
    debugPrint('Device Type: ${getDeviceType(context)}');
    debugPrint('Orientation: ${getOrientation(context)}');
    debugPrint('===================');
  }
}