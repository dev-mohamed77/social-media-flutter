import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:socailmedia/core/componants/pop_up_dialog.dart';

class ShowDialog {
  OverlayEntry? _overlay;

  void show(BuildContext context) {
    if (_overlay == null) {
      _overlay = OverlayEntry(
        builder: (context) {
          return PopUpDialog(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: const [
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Loading ...",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
      Overlay.of(context)!.insert(_overlay!);
    }
  }

  void hide() {
    if (_overlay != null) {
      _overlay!.remove();
      _overlay = null;
    }
  }

  static void showDialogWidget(
    context, {
    required Widget child,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return child;
      },
    );
  }

  static showToast({
    required String message,
  }) {
    return Fluttertoast.showToast(
      msg: message,
    );
  }
}
