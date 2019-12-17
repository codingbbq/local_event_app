import 'package:flutter/material.dart';
import 'package:local_events_app/models/event.dart';

class EventWidget extends StatelessWidget {

  final Event event;

  const EventWidget({ Key key, this.event }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      elevation: 4,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(24.0))
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              child: Image.asset(event.imagePath, height: 150, fit: BoxFit.fitWidth,),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          event.title,
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF000000)
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        FittedBox(
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.location_on),
                              SizedBox(width: 5.0,),
                              Text(
                                event.location,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Color(0xFF000000)
                                ),
                              )
                            ],
                          ),
                        )

                      ],
                    ),
                  ),

                  Expanded(
                    flex: 1,
                    child: Text(
                      event.duration.toUpperCase(),
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Color(0xFF000000)
                      )
                    ),
                  )

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}