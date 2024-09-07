import 'package:ecommerce/controllear/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageControllerImp controller = Get.put(HomePageControllerImp());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              Ink(
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  ),
                  gradient: LinearGradient(colors: [
                    Colors.white,
                    Colors.orangeAccent,
                    Colors.deepOrangeAccent,
                    Colors.deepOrange,
                    Color(0xffED7A07),
                  ]),
                ),
              ),
              Ink(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 140),
                child: Column(
                  children: [
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      color: Colors.white,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          gradient: LinearGradient(colors: [
                            Colors.white,
                            Colors.orangeAccent,
                            Colors.deepOrangeAccent,
                            Colors.deepOrange,
                            Color(0xffED7A07),
                          ]),
                        ),
                        child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(85),
                            child: Image.asset('assets/images/icon_logo.png',
                                width: 85, height: 85, fit: BoxFit.fill),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: 140,
            margin: const EdgeInsets.all(10),
            alignment: AlignmentDirectional.center,
            child: Column(
              children: [
                Text('${controller.username}',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xffED7A07),
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 3),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Card(
                  child: Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            ListTile(
                              leading:
                                  Icon(Icons.email, color: Color(0xffED7A07)),
                              title: Text("E-Mail".tr),
                              subtitle: Text("${controller.email}"),
                            ),
                            ListTile(
                              leading:
                                  Icon(Icons.phone, color: Color(0xffED7A07)),
                              title: Text("PhoneNumber".tr),
                              subtitle: Text("${controller.phone}"),
                            ),
                            ListTile(
                              leading:
                                  Icon(Icons.person, color: Color(0xffED7A07)),
                              title: Text("About".tr),
                              subtitle: Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              leading: Icon(Icons.my_location,
                                  color: Color(0xffED7A07)),
                              title: Text("Location".tr),
                              subtitle: Text("Canada"),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
