import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .39,
                  // color: Colors.amber,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 23.0),
                        child: OverflowBox(
                          child: Image.asset(
                            'assets/cutCircle2.png',
                            color: Theme.of(context).primaryColorLight,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.center,
                        child: Text('Welcome, Daniel',
                            style: TextStyle(fontSize: 30)),
                      ),
                      const Align(
                        alignment: Alignment.bottomCenter,
                        child: Icon(
                          Icons.account_circle_rounded,
                          size: 100,
                        ),
                      )
                    ],
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text('Olasiyan Daniel'),
                ),
                const ListTile(
                  leading: Icon(Icons.calendar_month),
                  title: Text('22/1/2023'),
                ),
                const ListTile(
                  leading: Icon(Icons.phone_android_rounded),
                  title: Text('08166545346'),
                ),
                const ListTile(
                  leading: Icon(Icons.camera_alt),
                  title: Text('Olasiyan Daniel'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChildWidget extends StatelessWidget {
  const ChildWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Stack(
          children: [
            const Positioned(
                // top: MediaQuery.of(context).size.height * .2,
                child: Icon(
              Icons.account_circle_rounded,
              size: 50,
            )),
            Positioned(
                top: 10,
                left: 10,
                child: Container(
                  // height: MediaQuery.of(context).size.width * .99,
                  // width: MediaQuery.of(context).size.width * .99,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(colors: [
                        Theme.of(context).primaryColor,
                        Theme.of(context).primaryColorLight,
                      ])),
                )),
            const Column(
              children: [
                Text('Welcome, Daniel'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
