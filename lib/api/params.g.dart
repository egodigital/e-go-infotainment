// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Carparams _$CarparamsFromJson(Map<String, dynamic> json) {
  return Carparams()
    ..batteryCharging = json['battery_chargin'] as String
    ..batteryChargingCurrent = json['battery_charging_current'] as int
    ..batteryHealth = json['battery_health'] as int
    ..batteryLoadingCapacity = json['battery_loading_capacity'] as int
    ..batteryStateOfCharge = json['battery_state_of_charge'] as int
    ..brakeFluidLevel = json['brake_fluid_level'] as int
    ..calculatedRemainingDistance = json['calculated_remaining_distance'] as int
    ..centralLockingSystem = json['central_locking_system'] as String
    ..distanceToObjectBack = json['distance_to_object_back'] as String
    ..distanceToObjectBottom = json['distance_to_object_bottom'] as int
    ..distanceToObjectFront = json['distance_to_object_front'] as String
    ..distanceToObjectLeft = json['distance_to_object_left'] as String
    ..distanceToObjectRight = json['distance_to_object_right'] as String
    ..distanceTrip = json['distance_trip'] as int
    ..doorDiscFrontLeft = json['door_disc_front_left'] as String
    ..doorDiscFrontRight = json['door_disc_front_right'] as String
    ..doorFrontLeft = json['door_front_left'] as String
    ..doorFrontRight = json['door_front_right'] as String
    ..driveMode = json['drive_mode'] as String
    ..flash = json['flash'] as String
    ..heatedSeats = json['heated_seats'] as String
    ..hightBeam = json['high_beam'] as String
    ..infotainment = json['infotainment'] as String
    ..infotainmentVolume = json['infotainment_volume'] as int
    ..location = json['location'] as String
    ..mileage = json['mileage'] as int
    ..motorControlLamp = json['motor_control_lamp'] as String
    ..personCount = json['person_count'] as int
    ..pulseSensorSteeringWheel = json['pulse_sensor_steering_wheel'] as String
    ..powerConsumption = json['power_consumption'] as int
    ..rainSensor = json['rain_sensor'] as String
    ..rearRunningLights = json['rear_running_lights'] as String
    ..sideLights = json['side_lights'] as String
    ..speed = json['speed'] as int
    ..stopLights = json['stop_lights'] as String
    ..temperatureInside = json['temperature_inside'] as int
    ..temperatureOutside = json['temperature_outside'] as int
    ..tirePressureBackLeft =
        (json['tire_pressure_back_left'] as num)?.toDouble()
    ..tirePressureBackRight =
        (json['tire_pressure_back_right'] as num)?.toDouble()
    ..tirePressureFrontLeft =
        (json['tire_pressure_front_left'] as num)?.toDouble()
    ..tirePressureFrontRight =
        (json['tire_pressure_front_right'] as num)?.toDouble()
    ..trunk = json['trunk'] as String
    ..turnSignalLeft = json['turn_signal_left'] as String
    ..turnSignalRight = json['turn_signal_right'] as String
    ..warningBlinker = json['warning_blinker'] as String
    ..weight = json['weight'] as int
    ..windshieldWipers = json['windshield_wipers'] as String
    ..wipingWaterLevel = json['wiping_water_level'] as int;
}

Map<String, dynamic> _$CarparamsToJson(Carparams instance) => <String, dynamic>{
      'battery_chargin': instance.batteryCharging,
      'battery_charging_current': instance.batteryChargingCurrent,
      'battery_health': instance.batteryHealth,
      'battery_loading_capacity': instance.batteryLoadingCapacity,
      'battery_state_of_charge': instance.batteryStateOfCharge,
      'brake_fluid_level': instance.brakeFluidLevel,
      'calculated_remaining_distance': instance.calculatedRemainingDistance,
      'central_locking_system': instance.centralLockingSystem,
      'distance_to_object_back': instance.distanceToObjectBack,
      'distance_to_object_bottom': instance.distanceToObjectBottom,
      'distance_to_object_front': instance.distanceToObjectFront,
      'distance_to_object_left': instance.distanceToObjectLeft,
      'distance_to_object_right': instance.distanceToObjectRight,
      'distance_trip': instance.distanceTrip,
      'door_disc_front_left': instance.doorDiscFrontLeft,
      'door_disc_front_right': instance.doorDiscFrontRight,
      'door_front_left': instance.doorFrontLeft,
      'door_front_right': instance.doorFrontRight,
      'drive_mode': instance.driveMode,
      'flash': instance.flash,
      'heated_seats': instance.heatedSeats,
      'high_beam': instance.hightBeam,
      'infotainment': instance.infotainment,
      'infotainment_volume': instance.infotainmentVolume,
      'location': instance.location,
      'mileage': instance.mileage,
      'motor_control_lamp': instance.motorControlLamp,
      'person_count': instance.personCount,
      'pulse_sensor_steering_wheel': instance.pulseSensorSteeringWheel,
      'power_consumption': instance.powerConsumption,
      'rain_sensor': instance.rainSensor,
      'rear_running_lights': instance.rearRunningLights,
      'side_lights': instance.sideLights,
      'speed': instance.speed,
      'stop_lights': instance.stopLights,
      'temperature_inside': instance.temperatureInside,
      'temperature_outside': instance.temperatureOutside,
      'tire_pressure_back_left': instance.tirePressureBackLeft,
      'tire_pressure_back_right': instance.tirePressureBackRight,
      'tire_pressure_front_left': instance.tirePressureFrontLeft,
      'tire_pressure_front_right': instance.tirePressureFrontRight,
      'trunk': instance.trunk,
      'turn_signal_left': instance.turnSignalLeft,
      'turn_signal_right': instance.turnSignalRight,
      'warning_blinker': instance.warningBlinker,
      'weight': instance.weight,
      'windshield_wipers': instance.windshieldWipers,
      'wiping_water_level': instance.wipingWaterLevel
    };
