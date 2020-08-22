import 'package:dadjokesmobile/dad_jokes_service.dart';
import 'package:dadjokesmobile/search_screen.dart';
import 'package:dadjokesmobile/slide_transition.dart';
import 'package:flutter/material.dart';

class RandomJokeScreen extends StatefulWidget {
  @override
  _RandomJokeScreenState createState() => _RandomJokeScreenState();
}

class _RandomJokeScreenState extends State<RandomJokeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xFF80CAAA),
            Color(0xFF62BD96),
          ],
          end: Alignment.bottomRight,
          begin: Alignment.topLeft,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder(
          future: DadJokesService.getRandomJoke(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  Spacer(),
                  Text(
                    '\"${snapshot.data}\"',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .apply(color: Colors.white),
                    maxLines: 12,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 40),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            color: Color(0xFFF15839),
                            onPressed: () {
                              setState(() {});
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: Text('Random Joke',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      .apply(color: Colors.white)),
                            ),
                          ),
                        ),
                        SizedBox(width: 4),
                        Expanded(
                          child: RaisedButton(
                            color: Color(0xFFF15839),
                            onPressed: () {
                              Navigator.of(context).pushReplacement(SlideRoute(widget: SearchScreen()));
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: Text('Search',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      .apply(color: Colors.white)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                ),
              );
            }
          },
        ),
      ),
    );
  }
}