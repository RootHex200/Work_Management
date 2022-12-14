import 'package:flutter/material.dart';
import 'package:work_manager/service/notification_service.dart';
import 'package:work_manager/view/addtask/add_task.dart';
import 'package:work_manager/view/homepage/component/appbar.dart';
import 'package:work_manager/view/homepage/component/date_time.dart';
import 'package:work_manager/view/homepage/component/task_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationClass().initiallizationPlatform(context);
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          CustomAppBar(),
          SizedBox(
            height: 30,
          ),
          DateTimeView(),
          SizedBox(
            height: 30,
          ),
          TaskView()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const AddTask()));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
