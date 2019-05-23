import 'package:json_annotation/json_annotation.dart';

part 'params.g.dart';

@JsonSerializable()
class Carparams {
  Carparams();

  @JsonKey(name: 'battery_chargin')
  String batteryCharging;

  @JsonKey(name: 'battery_charging_current')
  int batteryChargingCurrent;

  @JsonKey(name: 'battery_health')
  int batteryHealth;

  @JsonKey(name: 'battery_loading_capacity')
  int batteryLoadingCapacity;

  @JsonKey(name: 'battery_state_of_charge')
  int batteryStateOfCharge;

  @JsonKey(name: 'brake_fluid_level')
  int brakeFluidLevel;

  @JsonKey(name: 'calculated_remaining_distance')
  int calculatedRemainingDistance;

  @JsonKey(name: 'central_locking_system')
  String centralLockingSystem;

  @JsonKey(name: 'distance_to_object_back')
  String distanceToObjectBack;

  @JsonKey(name: 'distance_to_object_bottom')
  int distanceToObjectBottom;

  @JsonKey(name: 'distance_to_object_front')
  String distanceToObjectFront;

  @JsonKey(name: 'distance_to_object_left')
  String distanceToObjectLeft;

  @JsonKey(name: 'distance_to_object_right')
  String distanceToObjectRight;

  @JsonKey(name: 'distance_trip')
  int distanceTrip;

  @JsonKey(name: 'door_disc_front_left')
  String doorDiscFrontLeft;

  @JsonKey(name: 'door_disc_front_right')
  String doorDiscFrontRight;

  @JsonKey(name: 'door_front_left')
  String doorFrontLeft;

  @JsonKey(name: 'door_front_right')
  String doorFrontRight;

  @JsonKey(name: 'drive_mode')
  String driveMode;

  @JsonKey(name: 'flash')
  String flash;

  @JsonKey(name: 'heated_seats')
  String heatedSeats;

  @JsonKey(name: 'high_beam')
  String hightBeam;

  @JsonKey(name: 'infotainment')
  String infotainment;

  @JsonKey(name: 'infotainment_volume')
  int infotainmentVolume;

  @JsonKey(name: 'location')
  String location;

  @JsonKey(name: 'mileage')
  int mileage;

  @JsonKey(name: 'motor_control_lamp')
  String motorControlLamp;

  @JsonKey(name: 'person_count')
  int personCount;

  @JsonKey(name: 'pulse_sensor_steering_wheel')
  String pulseSensorSteeringWheel;

  @JsonKey(name: 'power_consumption')
  int powerConsumption;

  @JsonKey(name: 'rain_sensor')
  String rainSensor;

  @JsonKey(name: 'rear_running_lights')
  String rearRunningLights;

  @JsonKey(name: 'side_lights')
  String sideLights;

  @JsonKey(name: 'speed')
  int speed;

  @JsonKey(name: 'stop_lights')
  String stopLights;

  @JsonKey(name: 'temperature_inside')
  int temperatureInside;

  @JsonKey(name: 'temperature_outside')
  int temperatureOutside;

  @JsonKey(name: 'tire_pressure_back_left')
  double tirePressureBackLeft;

  @JsonKey(name: 'tire_pressure_back_right')
  double tirePressureBackRight;

  @JsonKey(name: 'tire_pressure_front_left')
  double tirePressureFrontLeft;

  @JsonKey(name: 'tire_pressure_front_right')
  double tirePressureFrontRight;

  @JsonKey(name: 'trunk')
  String trunk;

  @JsonKey(name: 'turn_signal_left')
  String turnSignalLeft;

  @JsonKey(name: 'turn_signal_right')
  String turnSignalRight;

  @JsonKey(name: 'warning_blinker')
  String warningBlinker;

  @JsonKey(name: 'weight')
  int weight;

  @JsonKey(name: 'windshield_wipers')
  String windshieldWipers;

  @JsonKey(name: 'wiping_water_level')
  int wipingWaterLevel;

  factory Carparams.fromJson(Map<String, dynamic> json) => _$CarparamsFromJson(json);

  Map<String, dynamic> toJson() => _$CarparamsToJson(this);
}
