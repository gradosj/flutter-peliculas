import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CastingsCards extends StatelessWidget {
  const CastingsCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: 180,
      // color: Colors.red,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, int index) {
          return _CastCard();
        },
      ),
    );
  }
}

class _CastCard extends StatelessWidget {
  const _CastCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      //   color: Colors.green,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage(
            placeholder: AssetImage('assets/no-image.jpg'),
            image: NetworkImage('https://picsum.photos/100/130?image=0'),
            height: 140,
            width: 100,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'actor.name asdkasd asasd',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        )
      ]),
    );
  }
}
