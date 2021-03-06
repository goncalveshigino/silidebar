import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shoes_app/bloc_navigation/navigator_bloc.dart';
import 'package:shoes_app/sidebar/menu_item.dart';

class SideBar extends StatefulWidget {
  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<SideBar> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  StreamController<bool> isSidebarOpenedStramController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;
  final bool isSidebarOpened = true;
  final _animationDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStramController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStramController.stream;
    isSidebarOpenedSink = isSidebarOpenedStramController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStramController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return StreamBuilder(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSiderBarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSiderBarOpenedAsync.data ? 0 : -screenWidth,
          right: isSiderBarOpenedAsync.data ? 0 : screenWidth - 45,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color: Color(0xFF262AAA),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      ListTile(
                        title: Text('Higino Luis',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w800)),
                        subtitle: Text('goncalveshino@gmail.com',
                            style: TextStyle(
                                fontSize: 20, color: Color(0xFF1BB5FD))),
                        leading: CircleAvatar(
                          child: Icon(
                            Icons.perm_identity,
                            color: Colors.white,
                          ),
                          radius: 40,
                        ),
                      ),
                      Divider(
                        height: 64,
                        thickness: 0.5,
                        indent: 32,
                        endIndent: 32,
                        color: Colors.white.withOpacity(0.3),
                      ),
                      MenuItem(
                        icon: Icons.home,
                        title: "Home ",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigationEvents.HomePageChickedEvent);
                        },
                      ),
                      MenuItem(
                        icon: Icons.person,
                        title: "My Account ",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigationEvents.AcccountPageChickedEvent);
                        },
                      ),
                      MenuItem(
                        icon: Icons.shopping_basket,
                        title: "My Order",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigationEvents.OrderPageChickedEvent);
                        },
                      ),
                      MenuItem(
                        icon: Icons.card_giftcard, 
                        title: "Wishlist",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigationEvents.OrderPageChickedEvent);
                        },
                      ),
                      Divider(
                        height: 64,
                        thickness: 0.5,
                        indent: 32,
                        endIndent: 32,
                        color: Colors.white.withOpacity(0.3),
                      ),
                      MenuItem(icon: Icons.settings, title: "Settings"),
                      MenuItem(icon: Icons.exit_to_app, title: "Logout"),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.9),
                child: GestureDetector(
                  onTap: () {
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomMenuclipper(),
                    child: Container(
                      width: 35,
                      height: 110,
                      color: Color(0xFF262AAA),
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                          progress: _animationController.view,
                          icon: AnimatedIcons.menu_close,
                          color: Color(0xFF1BB5FD),
                          size: 25),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class CustomMenuclipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
