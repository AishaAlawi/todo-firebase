import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../model/task_model.dart';

class TodoController extends GetxController {
  var isLoading = false;
  var taskList = <TaskModel>[];

  Future<void> addTodo(String task, bool complete, String id) async {
    await FirebaseFirestore.instance
        .collection('todos')
        .doc(id != '' ? id : null)
        .set(
      {
        'task': task,
        'complete': complete,
      },
      SetOptions(merge: true),
    ).then((value) => getData());
  }

  Future<void> getData() async {
    try {
      QuerySnapshot _taskSnap = await FirebaseFirestore.instance
          .collection('todos')
          .orderBy('task')
          .get();

      taskList.clear();
      for (var item in _taskSnap.docs) {
        taskList.add(
          TaskModel(
            item['task'],
            item['complete'],
            item.id,
          ),
        );
      }
      isLoading = false;
      update();
    } catch (e) {
      print(e.toString());
    }
  }

  void deleteTask(String id) {
    FirebaseFirestore.instance.collection('todos').doc(id).delete();
  }
}
