import 'dart:async';
import 'dart:isolate';

import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';

import 'package:work_manager/model/task_model.dart';

class IsarService {
  late Future<Isar> db;
  var receiveport = ReceivePort();
  //constructor
  IsarService() {
    db = openIsar();
  }

  //open isar database
  Future<Isar> openIsar() async {
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([TaskModelSchema], inspector: true);
    }
    return Future.value(Isar.getInstance());
  }
}

Future<void> createTask(newvalue) async {
  final service = IsarService();
  final isar = await service.db;
  isar.writeTxnSync<int>(() => isar.taskModels.putSync(newvalue));
}

Future<void> getTaskIsolate(value) async {
  final service = IsarService();
  final isar = await service.db;
  Stream stream =
      isar.taskModels.filter().dateEqualTo(value[1]).watch(fireImmediately: true);
  stream.listen((event) {
    value[0].send(event);
  });
}
