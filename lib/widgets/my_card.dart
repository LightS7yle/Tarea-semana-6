import 'package:flutter/material.dart';
import 'package:tarea_semana6/model/card_profile.dart';

class MyCard extends StatelessWidget {
  final CardProfile dataProfile;

  MyCard({required this.dataProfile});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
      child: ListTile(
        title: Text(dataProfile.name),
        subtitle: Text(dataProfile.date),
        trailing: IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        leading: Stack(
          children: [
            CircleAvatar(backgroundImage: NetworkImage(dataProfile.photo)),
            Positioned(
              right: 0,
              bottom: 0,
              child: dataProfile.isActive
                  ? Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF67FF3E),
                        ),
                        height: 10,
                        width: 10,
                      ),
                    )
                  : Text(""),
            )
          ],
        ),
      ),
    );
  }
}
