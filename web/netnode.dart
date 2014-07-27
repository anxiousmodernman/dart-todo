library netnode;

import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
import 'package:logging/logging.dart';

import 'package:netnode/component/listmanager_component.dart';

class DartTodoModule extends Module {
  
  Logger logger = new Logger("DartTodoModule");
  
  DartTodoModule() {
    type(ListManagerComponent);
    value(RouteInitializerFn, this.routeInitializer);
    factory(NgRoutingUsePushState,
      (_) => new NgRoutingUsePushState.value(false)
    );
  }

  void routeInitializer(Router router, RouteViewFactory views) {
    views.configure({
      'lists': ngRoute(path: '/lists', enter: views('view/listmanager.html'))
    });
  }
}

void main() {
  Logger.root..level = Level.FINEST
    ..onRecord.listen((LogRecord r) { print(r.message); });
  applicationFactory()
    ..addModule(new DartTodoModule())
    ..run();
}
