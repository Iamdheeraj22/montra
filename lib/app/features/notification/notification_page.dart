import 'package:flutter/material.dart';
import 'package:montra/app/core/res/app_colors.dart';
import 'package:montra/app/core/res/strings/app_heading.dart';
import 'package:montra/app/core/res/strings/app_messages.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});
  static const String id = '/notification_page';
  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Notification',
          style: TextStyle(
            fontSize: 18,
            color: AppColors.dark,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              //When click on more icon then show pop-menu
              showMenu(
                  context: context,
                  color: Colors.white,
                  position: const RelativeRect.fromLTRB(100, 60, 0, 0),
                  items: [
                    PopupMenuItem(
                      child: const Text(
                        AppHeading.hMarkAllRead,
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.dark,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {},
                    ),
                    PopupMenuItem(
                      child: const Text(
                        AppHeading.hRemoveAll,
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.dark,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {},
                    ),
                  ]);
            },
            icon: const Icon(
              Icons.more_horiz,
              size: 30,
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (ctx, i) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppMessages.sOnBoardingMessage2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.dark,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            AppMessages.sOnBoardingMessage1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 13,
                              color: AppColors.light20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '19:30',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.light20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
