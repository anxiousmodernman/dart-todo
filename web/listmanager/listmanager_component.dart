library netnode;

import 'package:angular/angular.dart';

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
  
  Task(this.id, this.text, this.complete);
}

@Component(
    selector: 'list-manager', 
    templateUrl: 'listmanager/listmanager_component.html', 
    publishAs: 'cmp')
class ListManagerComponent {
//  @NgOneWay('recipe-map')
//  Map<String, Recipe> recipeMap;

  @NgOneWay('allLists')
  List<TaskList> allLists;
  
  @NgOneWay('activeLists')
  List<TaskList> activeLists;
//  Recipe get recipe => recipeMap == null ? null : recipeMap[_recipeId];

  ListManagerComponent() {
    allLists = [];
    activeLists = [];
//    _recipeId = routeProvider.parameters['recipeId'];
  }
}
