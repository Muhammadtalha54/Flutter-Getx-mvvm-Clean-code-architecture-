import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/Data/Responce/App_Exceptions.dart';
import 'package:getx_mvvm/Data/Responce/Status.dart';
import 'package:getx_mvvm/Model/Home/Userlist_model.dart';
import 'package:getx_mvvm/Resources/Components/Internet_exception_widget.dart';
import 'package:getx_mvvm/Resources/Routes/Route_names.dart';
import 'package:getx_mvvm/Resources/colors/App_colors.dart';
import 'package:getx_mvvm/Utils/utils.dart';
import 'package:getx_mvvm/View_models/Controllers/Home/Userlist_controller.dart';
import 'package:getx_mvvm/View_models/Controllers/User_prefrences/User_prefrences.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final userlistcontroller1 = Get.put(Userlistcontroller());
  UserPrefrences userPrefrence = UserPrefrences();
  // Assuming the data is a list of a model called `User`

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userlistcontroller1.Userlistapi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.backgroundcolor,
      appBar: AppBar(
        title: Text("Get API Example"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                //logout and remove user from shared prefrenes
                userPrefrence.Removeuser().then((value) {
                  Get.toNamed(RouteNames.LoginScreen);
                });
              },
              icon: Icon(Icons.logout_outlined))
        ],
      ),
      body: Obx(() {
        switch (userlistcontroller1.rxRequestStatus.value) {
          case Status.LOADING:
            return Center(child: CircularProgressIndicator());
          case Status.ERROR:
            if (userlistcontroller1.error.value == 'No Internet connection') {
              return Internet_exception_widget(
                onpress: () {
                  userlistcontroller1.Userlistapi();
                },
              );
            } else {
              return Text(userlistcontroller1.error.value.toString());
            }

          case Status.COMPLETED:
            return ListView.builder(
              itemCount: userlistcontroller1.userlist.value.data!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                      title: Text(userlistcontroller1
                          .userlist.value.data![index].firstName
                          .toString()),
                      subtitle: Text(userlistcontroller1
                          .userlist.value.data![index].email
                          .toString()),
                      leading: CircleAvatar(
                          backgroundImage: NetworkImage(userlistcontroller1
                              .userlist.value.data![index].avatar
                              .toString())),
                    ),
                  ),
                );
              },
            );
        }
      }),
    );
  }
}
