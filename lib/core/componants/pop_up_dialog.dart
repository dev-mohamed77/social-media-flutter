import 'package:flutter/material.dart';
import 'package:socailmedia/core/utils/color_manager.dart';

class PopUpDialog extends StatelessWidget {
  const PopUpDialog({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 1.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: ConfigColor.kWhiteColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(40),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 12,
              offset: Offset(0, 12),
            )
          ],
        ),
        child: child,
      ),
    );
  }
}


// Padding(
//           padding: const EdgeInsets.all(10),
//           child: Row(
//             children: const [
//               Center(
//                 child: CircularProgressIndicator(),
//               ),
//               SizedBox(
//                 width: 15,
//               ),
//               Text(
//                 "Loading ...",
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//         ),