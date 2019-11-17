import 'dart:async';
import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class SmartGlasses {
   FlutterBlue flutterBlue = FlutterBlue.instance;
   BluetoothDevice device;
   static const String deviceName = "SmartGlasses";
   Guid eventServiceId = Guid("e88d6fb3-a480-4aab-8418-4f7a98f0a886");
   Guid directionServiceId = Guid("818400c8-fccc-4988-bd86-1471fff6dfc8");
   Guid directionCharacId = Guid("0d39d471-3692-4f21-b180-c2e53c841b88");
   Guid rangeCharacId = Guid("9acfe157-6faf-4284-8bce-6e393260371e");

   void connect() async {
      flutterBlue.startScan(timeout: Duration(seconds: 4));

      // List<ScanResult> scanResults = await flutterBlue.scanResults.firstWhere((scanResults) {
      //   for (final scanResult in scanResults) {
      //       device = scanResult.device;
      //       print('${device.name} found!');
      //       if (device.name == "SmartGlasses")
      //         return true;
      //     }
      //     return false;
      // });

      flutterBlue.scanResults.firstWhere((scanResults) {
        for (final scanResult in scanResults) {
            device = scanResult.device;
            print('${device.name} found!');
            if (device.name == deviceName)
              return true;
          }
          return false;
        }).then((scanResults) {
          return scanResults.firstWhere((scanResult) {
            return (scanResult.device.name == deviceName);
          }).device;
            }).then((device) {
              device.connect(timeout: Duration(seconds: 4));
              }).then((_){
                print("Connected to Smart Glasses !");
              });
   }

    void sendEvent(int eventType, int eventData) async {      
      flutterBlue.connectedDevices.then((devices) {
        devices.firstWhere((dev) {
          return dev.name == deviceName;
        }).discoverServices().then((services) {
          services.firstWhere((s) {
            return s.uuid == eventServiceId;
            }).characteristics.first.write([eventType,eventData]);
          });
      });
    }

    void sendDirection(int direction,range) async {
      flutterBlue.connectedDevices.then((devices) {
        devices.firstWhere((dev) {
          return dev.name == deviceName;
        }).discoverServices().then((services) {
          services.firstWhere((s) {
            return s.uuid == directionServiceId;
            }).characteristics.forEach((c) {
              if (c.uuid == directionCharacId) {
                c.write([direction]);
              } else if (c.uuid ==rangeCharacId) {
                c.write([range]);
              }
            });
          });
      });
    }
}