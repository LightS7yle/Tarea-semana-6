import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tarea_semana6/model/appointment_card_model.dart';
import 'package:tarea_semana6/model/card_profile.dart';
import 'package:tarea_semana6/widgets/appointment_card.dart';
import 'package:tarea_semana6/widgets/my_card.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CardProfile> fakeData = [
    CardProfile(
        name: "Dorothy Nelson",
        date: "09 Jan 2020, 8am - 10am",
        isActive: true,
        photo:
            "https://media.istockphoto.com/id/1300972573/photo/pleasant-young-indian-woman-freelancer-consult-client-via-video-call.jpg?b=1&s=612x612&w=0&k=20&c=gApYcn6GubvJA-YoMO00KZAShv66MHEwrsAbcmaq_cQ="),
    CardProfile(
        name: "Carl Pope",
        isActive: true,
        date: "09 Jan 2020, 11am - 2pm",
        photo: "https://pbs.twimg.com/media/FjU2lkcWYAgNG6d.jpg"),
    CardProfile(
        name: "Ora Murray",
        isActive: false,
        date: "10 Jan 2020, 9am - 10am",
        photo:
            "https://i2-prod.dailyrecord.co.uk/incoming/article26949550.ece/ALTERNATES/s615/280736056_5215739155160579_2994299419128774691_n.jpg")
  ];

  List<AppointmentCardModel> fakeDataAppointment = [
    AppointmentCardModel(
        name: "Lois \nPatterson",
        date: "12 Jan 2020, 8am - 10am",
        photo:
            "https://wisehealthynwealthy.com/wp-content/uploads/2022/01/CreativecaptionsforFacebookprofilepictures.jpg"),
    AppointmentCardModel(
        name: "Cecilia \nBogan",
        date: "13 Jan 2020, 9am - 10am",
        photo:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzqmG-uGYy1GcBfRJ1rhvKDnt3RkZsEDBNeg&usqp=CAU")
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFF3F6FF),
      appBar: AppBar(
        toolbarHeight: height * 0.125,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              padding: EdgeInsets.symmetric(horizontal: 32),
              onPressed: () {},
              icon: Icon(
                Icons.calendar_today,
                size: 24,
              ))
        ],
        leading: Padding(
          padding: const EdgeInsets.only(left: 32.0),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.drag_handle,
              size: 32,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Welcome back!",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.3))),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Dr. Peterson",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800),
                  )
                ]),
            SizedBox(
              height: 24,
            ),
            fakeDataAppointment.isNotEmpty
                ? AppointmentCard(
                    appointmentProfileData: fakeDataAppointment[0],
                    addCard: (AppointmentCardModel appointmentData) {
                      final card = CardProfile(
                          name: appointmentData.name,
                          date: appointmentData.date,
                          photo: appointmentData.photo);
                      setState(() {
                        fakeDataAppointment.removeAt(0);
                      });
                      setState(() {
                        fakeData.add(card);
                      });
                    },
                    removeRequirement: () {
                      setState(() {
                        fakeDataAppointment.removeAt(0);
                      });
                    })
                : Text(" No existen mas citas programadas"),
            SizedBox(
              height: 32,
            ),
            SizedBox(
              width: double.infinity,
              child: Text("New Appointments",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                      fontSize: 12, color: Colors.black.withOpacity(0.5))),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: fakeData.map((e) {
                    return MyCard(dataProfile: e);
                  }).toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
