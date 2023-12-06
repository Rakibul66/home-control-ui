import 'package:car_controller/widget/text_widget.dart';
import 'package:flutter/material.dart';
class CarPart extends StatelessWidget {
  final bool state;
  final String name;
  final VoidCallback onTap;
  const CarPart({super.key, required this.state, required this.name,required this.onTap});


  @override
  Widget build(BuildContext context) {
    Color customColor = Color(0xFF1B252D);

    return Container(
      padding: const EdgeInsets.only(left: 20),
      height: 150,
      width: 180,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: state ? Colors.blue : Colors.transparent,
              blurRadius: state ? 30 : 0,
            )
          ],
          color: state ? Color(0xFF1B252D) : Colors.black.withOpacity(0.5),

          borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text(name, 18, Colors.white, FontWeight.bold),
              const SizedBox(
                height: 10,
              ),
              text(state ? "Opened" : "Closed", 14,
                  Colors.white.withOpacity(.5), FontWeight.bold),
            ],
          ),
          const Spacer(),
          Transform.rotate(
            angle: -1.6,
            child: Transform.scale(
              scaleX: 1.5,
              scaleY: 1.5,
              child: Switch(
                activeColor: customColor,

                activeTrackColor: Colors.white,
                inactiveTrackColor: Colors.white.withOpacity(.1),
                value: state,
                onChanged: (value) => onTap(),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
