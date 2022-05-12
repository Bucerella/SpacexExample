import 'package:flutter/material.dart';
import 'package:spacex/models/spacex.dart';
import 'package:spacex/services/services.dart';
import 'package:spacex/utils/constants.dart';
import 'package:spacex/widgets/container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            image: AssetImage('assets/space.jpeg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppBar(
                backgroundColor: Colors.transparent.withOpacity(0.1),
                title: Image.asset(
                  'assets/spacex.png',
                  width: 160,
                  height: 70,
                  fit: BoxFit.cover,
                ),
                centerTitle: true,
              ),
              FutureBuilder<Spacex>(
                  future: Services().getSpacexDetail(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Expanded(
                        child: ListView.builder(
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  ContainerWidget(
                                    name: snapshot.data!.name.toString(),
                                    details: snapshot.data!.details.toString(),
                                    patch: snapshot.data!.links!.patch!.small
                                        .toString(),
                                    flightNumber:
                                        snapshot.data!.flightNumber.toString(),
                                    dateLocal:
                                        snapshot.data!.dateLocal.toString(),
                                  ),
                                ],
                              );
                            }),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: primary,
                          backgroundColor: white,
                        ),
                      );
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
