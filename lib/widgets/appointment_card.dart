import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tarea_semana6/model/appointment_card_model.dart';

class AppointmentCard extends StatelessWidget {
  final AppointmentCardModel appointmentProfileData;
  final Function(AppointmentCardModel) addCard;
  final Function removeRequirement;
  AppointmentCard(
      {required this.appointmentProfileData,
      required this.addCard,
      required this.removeRequirement});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xFFD8DFF6),
            spreadRadius: -1,
            blurRadius: 2,
            offset: Offset(0, 5),
          )
        ],
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
      ),
      child: Column(children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24)),
              color: Color(0xFF2D89FF)),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Appointment Request",
                      style: TextStyle(color: Colors.white54),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      onPressed: () {},
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Icon(
                      Icons.watch_later,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      appointmentProfileData.date,
                      style: GoogleFonts.poppins(
                          color: Colors.white, letterSpacing: 2),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 16),
                        height: 64,
                        width: 64,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    appointmentProfileData.photo))),
                      ),
                      Text(
                        appointmentProfileData.name,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        size: 32,
                        Icons.info_outline,
                        color: Color(0xFF2D89FF),
                      ))
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 72),
                          elevation: 0,
                          shape: StadiumBorder()),
                      onPressed: () {
                        addCard(appointmentProfileData);
                      },
                      child: Text("ACCEPT")),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Color(0xFFF3F6FF),
                          shape: StadiumBorder()),
                      onPressed: () {
                        removeRequirement();
                      },
                      child: Text(
                        "DECLINE",
                        style: TextStyle(color: Colors.black54),
                      )),
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}
