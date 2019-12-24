import 'package:flutter/material.dart';
import 'package:local_events_app/models/event.dart';
import 'package:local_events_app/models/guests.dart';
import 'package:provider/provider.dart';

class EventDetailsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final Event event = Provider.of<Event>(context);
    final double screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.20, vertical: 10.0),
            child: Text(
              event.title,
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
          ),
          FittedBox(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.20),
              child: Row(
                children: <Widget>[
                  Icon(Icons.location_on, color: Colors.white),
                  SizedBox(width: 5.0,),
                  Text(
                    event.location,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 80,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "GUESTS",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                for( final guest in guests) Padding(
                  padding: const EdgeInsets.all(10),
                  child: ClipOval(
                    child: Image.asset(
                      guest.imagePath,
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: event.punchLine1 + ' ', style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, color: Color(0xFFFF4700))),
                  TextSpan(text: event.punchLine2, style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)))
                ]
              ),
            ),
          ),
          if(event.description.isNotEmpty) Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(event.description, style: TextStyle(fontSize: 20.0, color: Color(0xFF000000)),),
          ),
          if(event.galleryImages.isNotEmpty) Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 20.0, left: 20.0),
            child: Text(
              "GALLERY",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          if(event.galleryImages.isNotEmpty) SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                for(final galleryImagePath in event.galleryImages) 
                  Container(
                    margin: const EdgeInsets.only(left: 16, right: 16, bottom: 32.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      child: Image.asset(
                        galleryImagePath,
                        width: 180,
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
              ],
            )
          )
        ],
      ),
    );
  }
}