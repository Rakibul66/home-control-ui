import 'package:car_controller/Services/Get/get_climate.dart';
import 'package:car_controller/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
 class Climate extends StatelessWidget {
    Climate({super.key});
   final GetClimate controller=Get.put(GetClimate());
   @override
   Widget build(BuildContext context) {
     Color customColor = Color(0xFF1B252D);
     return Scaffold(

       body: Container(
         padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
         height: double.infinity,
         width: double.infinity,
         decoration: const BoxDecoration(
           color: Color(0xFF1B252D), // Set the solid background color here
         ),
         child: Column(
           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 const Center(

                 ),
                 text(
                   "Air Conditionar",
                   20,
                   Colors.white,
                   FontWeight.bold,
                   letterspacel: 3,
                 ),

               ],
             ),
             const SizedBox(
               height: 30,
             ),
             Obx(() => Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 circleButton(Icons.autorenew, "Auto",controller.auto.value,() {controller.setAuto();}),
                 circleButton(Icons.ac_unit_rounded, "Cool",controller.cool.value, () {controller.setCool();}),
                 circleButton(Icons.electric_bolt, "Fan",controller.fan.value, () {controller.setFan();}),
                 circleButton(Icons.sunny, "Heat",controller.heat.value, () {controller.setHeat();}),
               ],
             ),),
             const Spacer(),
             Obx(() => SleekCircularSlider(
               innerWidget: (percentage) {
                 return Align(
                     alignment: Alignment.center,
                     child: SizedBox(
                       height: 60,
                       width: double.infinity,
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           text(
                               percentage.toInt().toString(),
                               50,
                               Colors.white,
                               FontWeight.bold),
                           Align(
                             alignment: Alignment.topLeft,
                             child: Container(
                               height: 15,
                               width: 15,
                               decoration: const BoxDecoration(
                                   color: Colors.white,
                                   shape: BoxShape.circle),
                             ),
                           )
                         ],
                       ),
                     ));
               },
               appearance: CircularSliderAppearance(
                 customColors: CustomSliderColors(
                   gradientEndAngle: 100,
                   gradientStartAngle: 100,
                   trackColors: [
                     Color(0xFF585ED7), // Start color
                     Color(0xFFF64754), // End color
                   ],
                   shadowColor: Colors.blue,
                   progressBarColors: [
                     Color(0xFF585ED7), // Start color
                     Color(0xFFF64754), // End color
                   ],
                   shadowMaxOpacity: 10,
                   dotColor: Color(0xFFF64754), // You can set dot color to one of the gradient colors
                   dynamicGradient: true,
                 ),

                 animationEnabled: true,
                 counterClockwise: true,
                 size: 280,
                 spinnerMode: false,
                 startAngle: 0,
                 angleRange: 359,
               ),
               initialValue: controller.value.value,
               max: 100,
               min: 0.0,
               onChange: (value) async {
                 controller.setValue(value);
               },
             ),),
             const Spacer(),
             Obx(() => Container(
               padding: const EdgeInsets.only(right: 20),
               height: 80,
               width: double.infinity,
               decoration: BoxDecoration(
                   boxShadow: [
                     BoxShadow(
                       color: controller.ac.value
                           ? Colors.blue
                           : Colors.blue.shade900.withOpacity(.1),
                       blurRadius: controller.ac.value ? 30 : 0,
                     )
                   ],
                   borderRadius: BorderRadius.circular(10),
                   color:
                   controller.ac.value
                       ? Colors.blue
                       : Colors.blue.shade900.withOpacity(.1)),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       text(controller.ac.value ? "AC is on" : "AC is off", 15, Colors.white,
                           FontWeight.bold),
                       const SizedBox(
                         height: 10,
                       ),
                       text("   Currently ${controller.value.value.ceil()} C", 12,
                           Colors.white.withOpacity(.5), FontWeight.bold)
                     ],
                   ),
                   Transform.scale(
                     scale: 1.5,
                     child: Switch(
                         activeTrackColor: customColor,
                         activeColor: Colors.blueGrey,
                         value: controller.ac.value,
                         onChanged: (value) => controller.setAc(),
                     ),
                   )
                 ],
               ),
             )),
             const Spacer(),
           ],
         ),
       ),
     );
   }
   Widget circleButton(IconData icon,String text_,bool state,VoidCallback onTap){
     return Column(
       children: [
         InkWell(
           onTap: onTap,
           child: Container(
             height: 45,
             width: 45,
             decoration: BoxDecoration(
               boxShadow: [
                 BoxShadow(
                   color: Colors.blueGrey,
                   blurRadius: state ? 20 : 0,
                 )
               ],
               color: state ? Colors.blue : Colors.blue.shade900,
               shape: BoxShape.circle,
             ),
             child: Center(
               child: Icon(
                 icon,
                 color: Colors.white,
               ),
             ),
           ),
         ),
         const SizedBox(
           height: 6,
         ),
         text(text_, 16, Colors.white,
             FontWeight.bold)
       ],
     );
   }
 }
