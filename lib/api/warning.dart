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
    } else if (newParams.batteryStateOfCharge < 30 &&
        (currentParams == null || currentParams.batteryStateOfCharge >= 30)) {
      final warning = Warning(Warning.STATE_YELLOW, 'Batterieladung < 30%', 'battery');
      warningController.add(warning);
    }
    if (newParams.calculatedRemainingDistance < 15 && (currentParams == null || currentParams.calculatedRemainingDistance >= 15)) {
      final warning = Warning(Warning.STATE_RED, 'Reichweite < 15 km', 'battery');
      warningController.add(warning);
    } else if (newParams.calculatedRemainingDistance < 30 &&
        (currentParams == null || currentParams.calculatedRemainingDistance >= 30)) {
      final warning = Warning(Warning.STATE_YELLOW, 'Reichweite < 30 km', 'battery');
      warningController.add(warning);
    }
    if (newParams.wipingWaterLevel < 15 && (currentParams == null || currentParams.wipingWaterLevel >= 15)) {
      final warning = Warning(Warning.STATE_RED, 'Wischwasser < 15%', 'battery');
      warningController.add(warning);
    } else if (newParams.wipingWaterLevel < 30 &&
        (currentParams == null || currentParams.wipingWaterLevel >= 30)) {
      final warning = Warning(Warning.STATE_YELLOW, 'Wischwasser < 30%', 'battery');
      warningController.add(warning);
    }
    if (newParams.powerConsumption > 35 && (currentParams == null || currentParams.powerConsumption <= 35)) {
      final warning = Warning(Warning.STATE_RED, 'Stromverbrauch hoch', 'battery');
      warningController.add(warning);
    }
    if (newParams.tirePressureBackLeft < 2 && (currentParams == null || currentParams.tirePressureBackLeft >= 2)) {
      final warning = Warning(Warning.STATE_RED, 'Reifendruck hinten links sehr niedrig', 'battery');
      warningController.add(warning);
    } else if (newParams.tirePressureBackLeft < 2.5 &&
        (currentParams == null || currentParams.tirePressureBackLeft >= 2.5)) {
      final warning = Warning(Warning.STATE_YELLOW, 'Reifendruck hinten links niedrig', 'battery');
      warningController.add(warning);
    }
    if (newParams.tirePressureBackRight < 2 && (currentParams == null || currentParams.tirePressureBackRight >= 2)) {
      final warning = Warning(Warning.STATE_RED, 'Reifendruck hinten rechts sehr niedrig', 'battery');
      warningController.add(warning);
    } else if (newParams.tirePressureBackRight < 2.5 &&
        (currentParams == null || currentParams.tirePressureBackRight >= 2.5)) {
      final warning = Warning(Warning.STATE_YELLOW, 'Reifendruck hinten rechts niedrig', 'battery');
      warningController.add(warning);
    }
    if (newParams.tirePressureFrontLeft < 2 && (currentParams == null || currentParams.tirePressureFrontLeft >= 2)) {
      final warning = Warning(Warning.STATE_RED, 'Reifendruck vorne links sehr niedrig', 'battery');
      warningController.add(warning);
    } else if (newParams.tirePressureFrontLeft < 2.5 &&
        (currentParams == null || currentParams.tirePressureFrontLeft >= 2.5)) {
      final warning = Warning(Warning.STATE_YELLOW, 'Reifendruck vorne links niedrig', 'battery');
      warningController.add(warning);
    }
    if (newParams.tirePressureFrontRight < 2 && (currentParams == null || currentParams.tirePressureFrontRight >= 2)) {
      final warning = Warning(Warning.STATE_RED, 'Reifendruck vorne rechts sehr niedrig', 'battery');
      warningController.add(warning);
    } else if (newParams.tirePressureFrontRight < 2.5 &&
        (currentParams == null || currentParams.tirePressureFrontRight >= 2.5)) {
      final warning = Warning(Warning.STATE_YELLOW, 'Reifendruck vorne rechts niedrig', 'battery');
      warningController.add(warning);
    }
    currentParams = newParams;
  }
}
