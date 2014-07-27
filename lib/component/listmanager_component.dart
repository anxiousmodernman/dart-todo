library listmanager_component;

import 'package:angular/angular.dart';
import 'package:logging/logging.dart';
import 'dart:convert';

class TaskList {
  String id;
  String name;  
  List<Task> tasks;

  TaskList(this.id, this.name, this.tasks);
}

class Task {
  String id;
  String text;
  bool complete;
  
  Task(this.id, this.text, [this.complete = false]);
}

@Component(
    selector: 'list-manager', 
    templateUrl: 'packages/netnode/component/listmanager_component.html',
    publishAs: 'cmp')
class ListManagerComponent {

  @NgOneWay('allLists')
  List<TaskList> allLists;
  
  @NgOneWay('activeLists')
  List<TaskList> activeLists;

  @NgTwoWay('taskInputs')
  Map<TaskList, String> taskInputs = {};

  void addTask(TaskList list) {
    var input = taskInputs[list];
    var logger = new Logger("Doosh ${input}}");
    logger.info("Adding a task! ${list}");
    list.tasks.add(new Task("2", input));
  }

  ListManagerComponent() {
    var taskA = new Task("1", "buy milk", false);
    var listA = new TaskList("1", "all", [taskA]);
    allLists = [listA];
    activeLists = [listA];
  }
}
