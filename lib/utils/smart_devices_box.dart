import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartDeviceBox extends StatelessWidget {
  final String smartDeviceName;
  final String iconPath;
  final bool powerOn;
  void Function(bool) ? onChanged;

  SmartDeviceBox({
    super.key,
    required this.iconPath,
    required this.powerOn,
    required this.smartDeviceName,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
            color: powerOn ? Colors.grey[800] : Colors.grey[400],
            borderRadius:BorderRadius.circular(24)
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 25
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              iconPath,
              height: 50,
                color: powerOn ? Colors.white : Colors.black
            ),
            Row(
              children: [
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(smartDeviceName,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: powerOn ? Colors.white : Colors.black
                        ),
                      ),
                    )
                ),
                Transform.rotate(
                  angle: pi/2,
                  child: CupertinoSwitch(
                      value: powerOn,
                      onChanged: onChanged),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
