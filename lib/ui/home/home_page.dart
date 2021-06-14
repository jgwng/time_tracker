import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage>{
  int _currentIndex = 0;

  List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  final List<BottomNavigationBarItem> _bNBItems = [
    BottomNavigationBarItem(
      label: "",
      icon: Icon(Icons.home_outlined),
      activeIcon: Icon(Icons.home),
    ),
    BottomNavigationBarItem(
      label: "",
      icon: Icon(Icons.today_outlined),
      activeIcon: Icon(Icons.today_outlined),
    ),
    BottomNavigationBarItem(
      label: "",
      icon: Icon(Icons.bar_chart_rounded),
      activeIcon: Icon(Icons.bar_chart_rounded),
    ),
    BottomNavigationBarItem(
      label: "",
      icon: Icon(Icons.settings_outlined),
      activeIcon: Icon(Icons.settings),)
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
        !await _navigatorKeys[_currentIndex].currentState!.maybePop();
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.white,
          title: Text('CATCHTIME',style: TextStyle(fontFamily: 'Staatliches',fontSize: 30,color: Colors.black),),
        centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            _buildOffstageNavigator(0),
            _buildOffstageNavigator(1),
            _buildOffstageNavigator(2),
            _buildOffstageNavigator(3),

          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,

            onTap: (newValue) {
              setState(() {
                if(_currentIndex == newValue){
                  _navigatorKeys[_currentIndex].currentState!.popUntil((route) => route.isFirst);
                }else{
                  _currentIndex = newValue;
                }
              });
            },
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            items: _bNBItems,
          fixedColor: Colors.indigo,
        ),

      ),
    );

  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          Container(color: Colors.red,),
          Container(color: Colors.purple),
          Container(color: Colors.blue,),
          Container(color:Colors.green)
        ].elementAt(index);
      },
    };
  }
  Widget _buildOffstageNavigator(int index) {
    var routeBuilders = _routeBuilders(context, index);
    return Offstage(
        offstage: _currentIndex != index,
        child: Navigator(
          key: _navigatorKeys[index],
          onGenerateRoute: (routeSettings) {
            return MaterialPageRoute(
              builder: (context) => routeBuilders[routeSettings.name]!(context),
            );
          },
        ));
  }

}