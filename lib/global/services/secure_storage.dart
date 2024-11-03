import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:platform_device_id/platform_device_id.dart';

class SecureStorage {
  String? deviceId;
  String? clientId;
  String? instanceId;
  String? serverIp;
  String? serverName;

  final storage = const FlutterSecureStorage();

  static String keyDeviceId = "device_id";
  static String keyClientId = "client_id";
  static String keyInstanceId = "instance_id";
  static String keyServerIp = "server_ip";
  static String keyServerName = "server_name";

  SecureStorage() {
    startUp();
  }

  void startUp() async {
    log("Initializing Secure Storage : ${DateTime.now()}");
    deviceId = await getDeviceId();
    if (deviceId != null) {
      clientId = await getClientId();
      if (clientId != null) {
        instanceId = await getInstanceId();
        serverIp = await getKeyValue(keyServerIp);
        serverName = await getKeyValue(keyServerName);
      }
    }
  }

  Future<String?> readDeviceId() async {
  //  deviceId = await PlatformDeviceId.getDeviceId;
    return deviceId;
  }

  void saveDeviceId(String? id) async {
    deviceId = id;
    if (id != null) await storage.write(key: keyDeviceId, value: id);
  }

  Future<String?> getDeviceId() async {
    if (deviceId != null) return deviceId;
    return deviceId = await storage.read(key: keyDeviceId);
  }

  Future<String?> getClientId() async {
    if (clientId != null) return clientId;
    return clientId = await storage.read(key: keyClientId);
  }

  void saveClientId(String id) async {
    clientId = id;
    await storage.write(key: keyClientId, value: id);
  }

  Future<String?> getInstanceId() async {
    if (instanceId != null) return instanceId;
    return instanceId = await storage.read(key: keyInstanceId);
  }

  void saveInstanceId(String? id) async {
    instanceId = id;
    if (id != null) await storage.write(key: keyInstanceId, value: id);
  }

  void saveKeyValue(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  Future<String?> getKeyValue(String key) async {
    return storage.read(key: key);
  }

  Future<void> deleteKey(String key) {
    return storage.delete(key: key);
  }
}
