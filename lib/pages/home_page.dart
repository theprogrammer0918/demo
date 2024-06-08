import 'package:demo/utils/smart_devices_box.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // list of smart devices
  List mySmartDevices = [
    //[smart_device_name, iconPath, powerStatus]
    ['Smart Light', 'lib/icons/light-bulb.png', true],
    ['Smart Fan', 'lib/icons/fan.png', false],
    ['Smart TV', 'lib/icons/smart-tv.png', false],
    ['Smart AC', 'lib/icons/air-conditioner.png', false]
  ];

  void powerSwitchChanged(bool value, int index){
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 25,
                horizontal: 40
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('lib/icons/menu.png',
                    height : 45,
                    color: Colors.grey[800],
                  ),
                  Icon(Icons.person,
                  size: 45,
                  color: Colors.grey[800],)

                ],
              ),
            ),
            const SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome Home,',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[700]
                    ),
                  ),
                  Text('MR. WHITE',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 72
                  )
                  )
                ],
              ),
            ),
            const SizedBox(height: 40,),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Divider(thickness: 1,),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text('Smart Devices',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.grey[800]
                  ),
                ),
            ),

            Expanded(
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: mySmartDevices.length,
                    padding: const EdgeInsets.all(25),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1/1.3
                    ),
                    itemBuilder: (context, index){
                      return SmartDeviceBox(
                        smartDeviceName: mySmartDevices[index][0],
                        iconPath: mySmartDevices[index][1],
                        powerOn: mySmartDevices[index][2],
                        onChanged: (value) => powerSwitchChanged(value, index),
                      );
                    }
                )
            )

          ],
        ),
      ),
    );
  }
}
