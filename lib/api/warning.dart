
import 'dart:async';
import 'params.dart';
import 'api.dart';

class Warning {
  static const int STATE_GREEN = 0;
  static const int STATE_YELLOW = 10;
  static const int STATE_RED = 20;
  int state;
  String notification;
  String icon;

  Warning(this.state, this.notification, this.icon);
}

class WarningEvaluator {
  static StreamController<Warning> warningController = StreamController.broadcast();

  StreamSubscription<Carparams> _notificationSubscription;
  Carparams currentParams;

  WarningEvaluator() {
    _notificationSubscription = EgoApi.notificationController.stream.listen((value) {
      evaluateWarnings(value);
    });
  }

  dispose() {
    _notificationSubscription.cancel();
  }

  evaluateWarnings(Carparams newParams) {
    if (newParams.batteryStateOfCharge < 15 && (currentParams == null || currentParams.batteryStateOfCharge >= 15)) {
      final warning = Warning(Warning.STATE_RED, 'Batterieladung < 15%', 'battery');
      warningController.add(warning);
    } else if (newParams.batteryStateOfCharge < 30 && (currentParams == null || currentParams.batteryStateOfCharge >= 30)) {
      final warning = Warning(Warning.STATE_YELLOW, 'Batterieladung < 30%', 'battery');
      warningController.add(warning);
    }
    currentParams = newParams;
  }

}