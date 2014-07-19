library netnode;

import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
import 'package:logging/logging.dart';

import 'listmanager/listmanager_component.dart';

class MyAppModule extends Module {
  MyAppModule() {
    type(ListManagerComponent);
  }
}

void main() {
  Logger.root..level = Level.FINEST
             ..onRecord.listen((LogRecord r) { print(r.message); });
  applicationFactory()
      .addModule(new MyAppModule())
      .run();
}
