import 'package:flutter/material.dart';

import '../../data/model/directions_model.dart';

class DistanceAndTime extends StatelessWidget {
  const DistanceAndTime({Key? key, this.directionsModel}) : super(key: key);

  final DirectionsModel? directionsModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Align(
        alignment: Alignment.topCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            DistanceAndTimeItem(
                text: '   ${directionsModel?.totalDuration}',
                icon: Icons.watch_later),
            DistanceAndTimeItem(
                text: '   ${directionsModel?.totalDistance}',
                icon: Icons.directions_car_filled),
          ],
        ),
      ),
    );
  }
}

class DistanceAndTimeItem extends StatelessWidget {
  const DistanceAndTimeItem({Key? key, required this.text, required this.icon})
      : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          children: [
            Icon(icon),
            Text(text),
          ],
        ),
      ),
    );
  }
}
