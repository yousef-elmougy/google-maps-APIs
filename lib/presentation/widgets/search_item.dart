import 'package:flutter/material.dart';

import '../../data/model/auto_complete_search_model.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({Key? key, required this.prediction, required this.onTap}) : super(key: key);

  final Prediction? prediction;
final GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: ColoredBox(
              color: Colors.white,
              child: ListTile(
                minVerticalPadding: 10,
                title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${prediction?.description?.split(',')[0]}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${prediction?.description?.replaceAll(prediction!.description!.split(',')[0], '').substring(2)}',
                        style: const TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ]),
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  child: Icon(
                    Icons.location_on,
                    color: Colors.blue[700],
                  ),
                ),
              ),
            ),
          ),
        ),
  );
}
