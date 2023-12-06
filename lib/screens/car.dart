import 'package:car_controller/Services/Get/get_car.dart';
import 'package:car_controller/widget/car_part.dart';
import 'package:car_controller/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Car extends StatelessWidget {
  Car({super.key});

  final GetCar controller = Get.put(GetCar());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/home.png', // Replace with your background image path
            fit: BoxFit.cover, // Adjust the BoxFit as needed
            width: double.infinity,
            height: double.infinity,
          ),
          Column(
            children: [
              Expanded(
                flex: 1,
                child: Stack(
                  children: [

                    Positioned(
                      top: 70,
                      left: 30,
                      right: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          text(
                            "Living room",
                            20,
                            Colors.white,
                            FontWeight.bold,
                            letterspacel: 8.0,
                          ),
                          InkWell(
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white10,
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.sunny,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                                () => CarPart(
                              name: "WIFI",
                              state: controller.engin.value,
                              onTap: () => controller.setEngine(),
                            ),
                          ),
                          Obx(
                                () => CarPart(
                              name: "A/C",
                              state: controller.door.value,
                              onTap: () => controller.setDoor(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                                () => CarPart(
                              name: "DeskLamp",
                              state: controller.trunk.value,
                              onTap: () => controller.setTrunk(),
                            ),
                          ),
                          Obx(
                                () => CarPart(
                              name: "SoundBox",
                              state: controller.climate.value,
                              onTap: () => controller.setClimate(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
