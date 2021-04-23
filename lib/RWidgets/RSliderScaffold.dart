// import 'package:flutter/material.dart';

// enum SlideDirection { LEFT_TO_RIGHT, RIGHT_TO_LEFT, TOP_TO_BOTTOM }

// class SliderMenuContainer extends StatefulWidget {
//   final Widget sliderMenu;
//   final Widget sliderMain;
//   final int animationDuration;
//   final double sliderMenuOpenSize;
//   final double sliderMenuCloseSize;
//   final bool isDraggable;
//   final bool hasAppBar;
//   final Color drawerIconColor;
//   final Widget drawerIcon;
//   final double drawerIconSize;
//   final Color splashColor;
//   final double appBarHeight;
//   final Widget title;
//   final bool isTitleCenter;
//   final bool isShadow;
//   final Color shadowColor;
//   final double shadowBlurRadius;
//   final double shadowSpreadRadius;
//   final Widget trailing;
//   final Color appBarColor;
//   final EdgeInsets appBarPadding;
//   final SlideDirection slideDirection;

//   const SliderMenuContainer({
//     Key key,
//     @required this.sliderMenu,
//     @required this.sliderMain,
//     this.isDraggable = true,
//     this.animationDuration = 200,
//     this.sliderMenuOpenSize = 265,
//     this.drawerIconColor = Colors.black,
//     this.drawerIcon,
//     this.splashColor = Colors.transparent,
//     this.isTitleCenter = true,
//     this.trailing,
//     this.appBarColor = Colors.white,
//     this.appBarPadding = const EdgeInsets.only(top: 24),
//     this.title = const Text('AppBar'),
//     this.drawerIconSize = 27,
//     this.appBarHeight = 70,
//     this.sliderMenuCloseSize = 0,
//     this.slideDirection = SlideDirection.LEFT_TO_RIGHT,
//     this.isShadow = false,
//     this.shadowColor = Colors.grey,
//     this.shadowBlurRadius = 25.0,
//     this.shadowSpreadRadius = 5.0,
//     this.hasAppBar = true,
//   }) : super(key: key);

//   @override
//   SliderMenuContainerState createState() => SliderMenuContainerState();
// }

// class SliderMenuContainerState extends State<SliderMenuContainer>
//     with TickerProviderStateMixin {
//   static const double WIDTH_GESTURE = 50.0;
//   static const double HEIGHT_GESTURE = 30.0;
//   static const double BLUR_SHADOW = 20.0;
//   double slideAmount = 0.0;
//   double _percent = 0.0;

//   AnimationController _animationDrawerController;
//   Animation animation;

//   bool dragging = false;

//   Widget drawerIcon;

//   /// check whether drawer is open
//   bool get isDrawerOpen => _animationDrawerController.isCompleted;

//   /// it's provide [animationController] for handle and lister drawer animation
//   AnimationController get animationController => _animationDrawerController;

//   /// Toggle drawer
//   void toggle() => _animationDrawerController.isCompleted
//       ? _animationDrawerController.reverse()
//       : _animationDrawerController.forward();

//   /// Open drawer
//   void openDrawer() => _animationDrawerController.forward();

//   /// Close drawer
//   void closeDrawer() => _animationDrawerController.reverse();

//   Offset getOffsetValues(SlideDirection direction, double value) {
//     switch (direction) {
//       case SlideDirection.LEFT_TO_RIGHT:
//         return Offset(value, 0);
//       case SlideDirection.RIGHT_TO_LEFT:
//         return Offset(-value, 0);
//       case SlideDirection.TOP_TO_BOTTOM:
//         return Offset(0, value);
//       default:
//         return Offset(value, 0);
//     }
//   }

//   Offset getOffsetValueForShadow(
//       SlideDirection direction, double value, double slideOpenWidth) {
//     switch (direction) {
//       case SlideDirection.LEFT_TO_RIGHT:
//         return Offset(value - (slideOpenWidth > 50 ? 20 : 10), 0);
//       case SlideDirection.RIGHT_TO_LEFT:
//         return Offset(-value - 5, 0);
//       case SlideDirection.TOP_TO_BOTTOM:
//         return Offset(0, value - (slideOpenWidth > 50 ? 15 : 5));
//       default:
//         return Offset(value - 30.0, 0);
//     }
//   }

//   @override
//   void initState() {
//     super.initState();

//     _animationDrawerController = AnimationController(
//         vsync: this,
//         duration: Duration(milliseconds: widget.animationDuration));

//     animation = Tween<double>(
//             begin: widget.sliderMenuCloseSize, end: widget.sliderMenuOpenSize)
//         .animate(CurvedAnimation(
//             parent: _animationDrawerController,
//             curve: Curves.easeIn,
//             reverseCurve: Curves.easeOut));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(builder: (context, constrain) {
//       return Container(
//           child: Stack(children: <Widget>[
//         /// Display Menu
//         // SlideMenuBar(
//         //   slideDirection: widget.slideDirection,
//         //   sliderMenu: widget.sliderMenu,
//         //   sliderMenuOpenSize: widget.sliderMenuOpenSize,
//         // ),

//         //Display Main Screen
//         AnimatedBuilder(
//           animation: _animationDrawerController,
//           builder: (_, child) {
//             return Transform.translate(
//               offset: getOffsetValues(widget.slideDirection, animation.value),
//               child: child,
//             );
//           },
//           child: GestureDetector(
//             behavior: HitTestBehavior.deferToChild,
//             onHorizontalDragStart: _onHorizontalDragStart,
//             onHorizontalDragEnd: _onHorizontalDragEnd,
//             onHorizontalDragUpdate: (detail) =>
//                 _onHorizontalDragUpdate(detail, constrain),
//             child: Container(
//               width: double.infinity,
//               height: double.infinity,
//               color: widget.appBarColor,
//               child: Column(
//                 children: <Widget>[
//                   if (widget.hasAppBar)
//                     // SliderAppBar(
//                     //   slideDirection: widget.slideDirection,
//                     //   onTap: () => toggle(),
//                     //   appBarHeight: widget.appBarHeight,
//                     //   animationController: _animationDrawerController!,
//                     //   appBarColor: widget.appBarColor,
//                     //   appBarPadding: widget.appBarPadding!,
//                     //   drawerIcon: widget.drawerIcon,
//                     //   drawerIconColor: widget.drawerIconColor,
//                     //   drawerIconSize: widget.drawerIconSize,
//                     //   isTitleCenter: widget.isTitleCenter,
//                     //   splashColor: widget.splashColor,
//                     //   title: widget.title,
//                     //   trailing: widget.trailing,
//                     // ),
//                     Expanded(child: widget.sliderMain),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ]));
//     });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _animationDrawerController.dispose();
//   }

//   void _onHorizontalDragStart(DragStartDetails detail) {
//     if (!widget.isDraggable) return;

//     //Check use start dragging from left edge / right edge then enable dragging
//     if ((widget.slideDirection == SlideDirection.LEFT_TO_RIGHT &&
//                 detail.localPosition.dx <= WIDTH_GESTURE) ||
//             (widget.slideDirection == SlideDirection.RIGHT_TO_LEFT &&
//                 detail.localPosition.dx >=
//                     WIDTH_GESTURE) /*&&
//         detail.localPosition.dy <= widget.appBarHeight*/
//         ) {
//       this.setState(() {
//         dragging = true;
//       });
//     }
//     //Check use start dragging from top edge / bottom edge then enable dragging
//     if (widget.slideDirection == SlideDirection.TOP_TO_BOTTOM &&
//         detail.localPosition.dy >= HEIGHT_GESTURE) {
//       this.setState(() {
//         dragging = true;
//       });
//     }
//   }

//   void _onHorizontalDragEnd(DragEndDetails detail) {
//     if (!widget.isDraggable) return;
//     if (dragging) {
//       openOrClose();
//       setState(() {
//         dragging = false;
//       });
//     }
//   }

//   void _onHorizontalDragUpdate(
//     DragUpdateDetails detail,
//     BoxConstraints constraints,
//   ) {
//     if (!widget.isDraggable) return;
//     // open drawer for left/right type drawer
//     if (dragging && widget.slideDirection == SlideDirection.LEFT_TO_RIGHT ||
//         widget.slideDirection == SlideDirection.RIGHT_TO_LEFT) {
//       var globalPosition = detail.globalPosition.dx;
//       globalPosition = globalPosition < 0 ? 0 : globalPosition;
//       double position = globalPosition / constraints.maxWidth;
//       var realPosition = widget.slideDirection == SlideDirection.LEFT_TO_RIGHT
//           ? position
//           : (1 - position);
//       move(realPosition);
//     }

//     // close drawer for left/right type drawer
//     if (isDrawerOpen &&
//         (widget.slideDirection == SlideDirection.LEFT_TO_RIGHT ||
//             widget.slideDirection == SlideDirection.RIGHT_TO_LEFT) &&
//         detail.delta.dx < 15) {
//       closeDrawer();
//     }
//   }

//   move(double percent) {
//     _percent = percent;
//     _animationDrawerController.value = percent;
//     _animationDrawerController.notifyListeners();
//   }

//   openOrClose() {
//     if (_percent > 0.3) {
//       openDrawer();
//     } else {
//       closeDrawer();
//     }
//   }
// }
