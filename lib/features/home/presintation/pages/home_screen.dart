import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:socailmedia/core/utils/color_manager.dart';
import 'package:socailmedia/features/home/presintation/manager/cubit/home_cubit.dart';
import 'package:socailmedia/features/home/presintation/manager/cubit/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey[300],
          body:
              HomeCubit.get(context).pages[HomeCubit.get(context).currentPages],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            selectedFontSize: 0,
            unselectedFontSize: 0,
            selectedItemColor: ConfigColor.kDarkColor,
            unselectedItemColor: ConfigColor.kgreyColor,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.home,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.facebookMessenger,
                ),
                label: "Chats",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications_none,
                ),
                label: "Notifications",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: "Account",
              ),
            ],
            currentIndex: HomeCubit.get(context).currentPages,
            onTap: (index) => HomeCubit.get(context).changePages(index),
          ),
        );
      },
    );
  }
}
