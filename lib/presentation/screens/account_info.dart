import 'package:flutter/material.dart';

class AccountInfo extends StatelessWidget {
  const AccountInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
        style: Theme.of(context).textTheme.bodyText2!,
        child: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: <Widget>[
                    // ============================================================
                    Container(
                      // A fixed-height child.
                      // color: const Color(0xffeeee00), // Yellow
                      height: 120.0,
                      // alignment: Alignment.center,
                      child: Text(
                        "BALANCE",
                        style:
                            // DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0),
                            TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 10),
                      ),
                    ),

                    // =============================================================

                    Container(
                      // A fixed-height child.
                      color: const Color(0xFF141410), // Yellow
                      height: 120.0,
                      alignment: Alignment.center,
                      child: Container(
                        height: 250,
                        width: 350,
                        child: Image.asset('assets/images/image.jpg'),
                      ),
                    ),

                    // ===============================================================
                    Expanded(
                      // A flexible child that will grow to fit the viewport but
                      // still be at least as big as necessary to fit its contents.
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: new BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Colors.red,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
  }
}


// import 'package:flutter/material.dart';

// class AccountInfo extends StatelessWidget {
//   const AccountInfo({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTextStyle(
//         style: Theme.of(context).textTheme.bodyText2!,
//         child: LayoutBuilder(builder:
//             (BuildContext context, BoxConstraints viewportConstraints) {
//           return SingleChildScrollView(
//             child: ConstrainedBox(
//               constraints: BoxConstraints(
//                 minHeight: viewportConstraints.maxHeight,
//               ),
//               child: IntrinsicHeight(
//                 child: Column(
//                   children: <Widget>[
//                     Container(
//                       // A fixed-height child.
//                       color: const Color(0xffeeee00), // Yellow
//                       height: 120.0,
//                       alignment: Alignment.center,
//                       child: const Text('Fixed Height Content'),
//                     ),
//                     Expanded(
//                       // A flexible child that will grow to fit the viewport but
//                       // still be at least as big as necessary to fit its contents.
//                       child: Container(
//                         color: const Color(0xffee0000), // Red
//                         height: 120.0,
//                         alignment: Alignment.center,
//                         child: const Text('Flexible Content'),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         }));
//   }
// }
