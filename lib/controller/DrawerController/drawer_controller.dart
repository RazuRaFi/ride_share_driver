// import 'package:flutter/material.dart';
//
// class CustomDrawerController {
//   late AnimationController animationController;
//   late Animation<Offset> drawerAnimation;
//   bool _isInitialized = false;
//   bool isDrawerOpen = false;
//
//   void init(TickerProvider vsync) {
//     animationController = AnimationController(
//       vsync: vsync,
//       duration: const Duration(milliseconds: 300),
//     );
//     drawerAnimation = Tween<Offset>(
//       begin: const Offset(-1.0, 0),
//       end: Offset.zero,
//     ).animate(animationController);
//     _isInitialized = true;
//   }
//
//   void toggleDrawer() {
//     if (!_isInitialized) return;
//
//     isDrawerOpen = !isDrawerOpen;
//     if (isDrawerOpen) {
//       animationController.forward();
//     } else {
//       animationController.reverse();
//     }
//   }
//
//   bool get isInitialized => _isInitialized;
//
//   void dispose() {
//     if (_isInitialized) animationController.dispose();
//   }
// }