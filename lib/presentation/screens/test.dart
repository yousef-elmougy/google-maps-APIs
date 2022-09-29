import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          minVerticalPadding: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  ';fpkgdmglkdsndfngodfngofn',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  ';fpkgdmglkdsndfngodfngofngofngofofgp[skgp[skgp[kgp[d',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ]),
          leading: CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: Icon(
              Icons.location_on,
              color: Colors.blue[700],
            ),
          ),
          tileColor: Colors.white,
        ),
      ),
    );
  }
}
