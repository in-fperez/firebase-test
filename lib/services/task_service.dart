import 'package:cloud_firestore/cloud_firestore.dart';
import '../firestore/firestore_instance.dart';
import '../models/task.dart';

class TaskService {
  static void initTaskSnapshotsListener(
    void Function(
      List<Task> tasks,
      List<Task> addedTasks,
      List<Task> modifiedTasks,
      List<String> taskRemovedIds,
    )
        onTasksAddedOrModified,
  ) {
    firestore.collection('tasks').snapshots().listen(
      (snapshot) {
        List<Task> tasks = snapshot.docs
            .map((doc) => Task.fromFirebaseMap(doc.id, doc.data()))
            .toList();
        List<Task> addedTasks = [];
        List<Task> modifiedTasks = [];
        List<String> taskRemovedIds = [];

        for (var docChange in snapshot.docChanges) {
          String id = docChange.doc.id;
          if (docChange.type.name == DocumentChangeType.added.name) {
            addedTasks.add(Task.fromFirebaseMap(id, docChange.doc));
          } else if (docChange.type.name == DocumentChangeType.modified.name) {
            modifiedTasks.add(Task.fromFirebaseMap(id, docChange.doc));
          } else if (docChange.type.name == DocumentChangeType.removed.name) {
            taskRemovedIds.add(id);
          }
        }
        onTasksAddedOrModified(
          tasks,
          addedTasks,
          modifiedTasks,
          taskRemovedIds,
        );
      },
    );
  }
}
