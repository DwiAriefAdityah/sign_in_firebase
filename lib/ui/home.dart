import 'package:flutter/material.dart';
import 'package:sign_in_firebase/utils/firebase_auth.dart';

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Home Page"),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text("Home Page"),
//             RaisedButton(
//               child: Text("Log Out"),
//               onPressed: (){
//                 AuthProvider().logOut();
//               },
//             )
//           ],
//         ),
//       ),

//     );
//   }
// }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var x = AuthProvider().logOut();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Home Page"),
            RaisedButton(
              child: Text("Log Out"),
              onPressed: (){
                x;
              },
            )
          ],
        ),
      ),

    );
  }
}