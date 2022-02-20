// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:interview_test_projects/app/modules/home/widgets/details_text_widget.dart';
import 'package:interview_test_projects/app/modules/home/widgets/title_text_widget.dart';
import 'package:interview_test_projects/app/repo/dio_client.dart';

import '../../../model/user_model.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: controller.streamController.stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Text('Save User with Like Button');
            } else if (snapshot.connectionState == ConnectionState.done) {
              return SizedBox(
                height: 20,
                width: 20,
                child: Center(
                  child: CircularProgressIndicator(strokeWidth: 2,),
                ),
              );
            }
            return TitleTextWidget(snapshot.data!.toString());
          },
        ),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<List<UserLIstModel>>(
            future: DioClient().getUserData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    physics:  BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 10,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        TitleTextWidget(
                                          snapshot.data![index].name.toString(),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        IconButton(
                                            onPressed: () async {
                                              var username = snapshot
                                                  .data![index].name
                                                  .toString();
                                              controller.setUserData(username);
                                              controller.addSelectedUser();
                                            },
                                            icon: Icon(
                                              CupertinoIcons.heart,
                                              color: Colors.red,
                                            ),
                                            iconSize: 18)
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        DetailsTextWidget(snapshot
                                            .data![index].email
                                            .toString()),
                                        DetailsTextWidget(snapshot
                                            .data![index].phone
                                            .toString()),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              }
              return Center(
                  child: CircularProgressIndicator(
                strokeWidth: 2,
              ));
            }),
      ),
    );
  }
}
