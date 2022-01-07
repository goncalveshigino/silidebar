import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_app/bloc_navigation/navigator_bloc.dart';
import 'package:shoes_app/pages/home/home_page.dart';
import 'package:shoes_app/sidebar/sidebar.dart';

class SidebarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider<NavigationBloc>(
      create: (_) => NavigationBloc(),
      child: Stack(
        children: [
          BlocBuilder<NavigationBloc, NavigationStates>(
            builder: (context, navigationState) {
              return navigationState as Widget;
            },
          ),
          SideBar(),
        ],
      ),
    ));
  }
}
