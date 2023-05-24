import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:learningcards/app/app_dimen.dart';
import 'package:learningcards/app/app_theme.dart';
import 'package:learningcards/features/common/application/timer_cubit.dart';
import 'package:learningcards/features/home/home_page.dart';
import 'package:learningcards/gen/assets.gen.dart';
import 'package:learningcards/injectable.dart';

void main() async {
  await configureDependencies(Environment.prod);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<TimerCubit>(
                create: (context) => TimerCubit(),
              )
            ],
            child: MaterialApp(
              title: 'Flutter Demo',
              theme: appTheme,
              home: const MyAppWrapper(),
            ),
          );
        });
  }
}

class MyAppWrapper extends StatefulWidget {
  const MyAppWrapper({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppWrapperState createState() => _MyAppWrapperState();
}

class _MyAppWrapperState extends State<MyAppWrapper> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    //theme = Theme.of(context).extension<AppColors>()!;
  }

  List<Widget> _buildScreens() {
    return [
      const HomePage(),
      const HomePage(), //TODO HERE GOES THE OTHER PAGES
      const HomePage(), //TODO HERE GOES THE OTHER PAGES
      const HomePage(), //TODO HERE GOES THE OTHER PAGES
      const HomePage(), //TODO HERE GOES THE OTHER PAGES
    ];
  }

/*   List<PersistentBottomNavBarItem> _navBarsItems() {
    final theme = Theme.of(context).extension<AppColors>()!;
    return [
      PersistentBottomNavBarItem(
        icon: Assets.home.svg(),
        inactiveIcon: Assets.discover.svg(),
        title: ("Home"),
        activeColorPrimary: theme.text!,
        inactiveColorPrimary: theme.disabled!,
      ),
      PersistentBottomNavBarItem(
        icon: Container(width: 20, child: Assets.discover.svg(width: 20, height: 20)),
        iconSize: 20,
        title: ("Discover"),
        activeColorPrimary: theme.text!,
        inactiveColorPrimary: theme.disabled!,
      ),
      PersistentBottomNavBarItem(
        icon: Assets.activity.svg(),
        title: ("Activity"),
        activeColorPrimary: theme.text!,
        inactiveColorPrimary: theme.disabled!,
      ),
      PersistentBottomNavBarItem(
        icon: Assets.bookmark.svg(),
        title: ("Bookmarks"),
        activeColorPrimary: theme.text!,
        inactiveColorPrimary: theme.disabled!,
      ),
      PersistentBottomNavBarItem(
        icon: Assets.profile.svg(),
        title: ("Profile"),
        activeColorPrimary: theme.text!,
        inactiveColorPrimary: theme.disabled!,
      ),
    ];
  }
 */
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppColors>()!;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: theme.background),
        child: _buildScreens().elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          unselectedLabelStyle: Theme.of(context).textTheme.labelSmall!.copyWith(color: theme.disabled),
          selectedLabelStyle: Theme.of(context).textTheme.labelSmall!.copyWith(color: theme.white),
          unselectedIconTheme: IconThemeData(color: theme.disabled),
          unselectedItemColor: theme.disabled,
          selectedIconTheme: IconThemeData(color: theme.white),
          type: BottomNavigationBarType.fixed, // Fixed
          backgroundColor: Colors.black, //
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: AppDimen.h10),
                child: Assets.home.svg(),
              ),
              label: ("Home"),
            ),
            BottomNavigationBarItem(
              icon: Padding(padding: EdgeInsets.only(bottom: AppDimen.h10), child: Assets.discover.svg()),
              label: ("Discover"),
            ),
            BottomNavigationBarItem(
              icon: Padding(padding: EdgeInsets.only(bottom: AppDimen.h10), child: Assets.activity.svg()),
              label: ("Activity"),
            ),
            BottomNavigationBarItem(
              icon: Padding(padding: EdgeInsets.only(bottom: AppDimen.h10), child: Assets.bookmarks.svg()),
              label: ("Bookmarks"),
            ),
            BottomNavigationBarItem(
              icon: Padding(padding: EdgeInsets.only(bottom: AppDimen.h10), child: Assets.profile.svg()),
              label: ("Profile"),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5),
    );

    /*  body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: theme.black!,
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style3, // Choose the nav bar style with this property.
      ),
    ); */
  }
}
