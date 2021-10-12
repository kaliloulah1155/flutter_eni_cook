import 'package:flutter/material.dart';

class TextLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

       decoration: BoxDecoration(
         color: Colors.yellow[100]
       ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello , World!',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            'Text can wrap without issue',
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing"
              "elit. Etiam at mauris massa. Suspendisse potenti."
              "Aenean aliquet eu nisl vitae tempus."
         ),
          Divider(),
          RichText(
              text: TextSpan(
                text: 'Flutter text is ',
                style: TextStyle(fontSize: 22,color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                    text: 'really',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red
                    ),
                    children: [
                      TextSpan(
                        text:'powerful.',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.double,
                          fontSize: 40
                        )
                      )
                    ]
                  ),
                ],
              ),
          ),
        ],
      ),
    );
  }
}
