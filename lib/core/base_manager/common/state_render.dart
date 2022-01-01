// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:socailmedia/core/componants/default_button.dart';
import 'package:socailmedia/core/componants/pop_up_dialog.dart';
import 'package:socailmedia/core/utils/assets_manager.dart';
import 'package:socailmedia/core/utils/color_manager.dart';
import 'package:socailmedia/core/utils/strings_manager.dart';

enum StateRenderType {
  POPUP_LOADING_STATE,
  POPUP_ERROR_STATE,
  FULL_SCREEN_LOADING_STATE,
  FULL_SCREEN_ERROR_STATE,
  CONTENT_SCREEN_STATE,
  EMPTY_SCREEN_STATE,
}

class StateRender extends StatelessWidget {
  const StateRender({
    Key? key,
    required this.state,
    required this.retryActionFunction,
    String? message,
    String? title,
  })  : _message = message ?? "Loading ...",
        super(key: key);

  final StateRenderType state;
  final String _message;
  final Function? retryActionFunction;

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case StateRenderType.POPUP_LOADING_STATE:
        return const PopUpDialog(
          child: GetImageContent(
            path: AssetsManager.loadingLottie,
          ),
        );

      case StateRenderType.POPUP_ERROR_STATE:
        return PopUpDialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const GetImageContent(
                path: AssetsManager.error1Lottie,
              ),
              GetMessageContent(message: _message),
              DefaultButton(
                text: StringsManager.retry,
                onClick: () {
                  if (state == StateRenderType.FULL_SCREEN_ERROR_STATE) {
                    retryActionFunction?.call();
                  } else {
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          ),
        );

      case StateRenderType.FULL_SCREEN_LOADING_STATE:
        return GetColumnWidget(
          children: [
            const GetImageContent(
              path: AssetsManager.loadingLottie,
            ),
            GetMessageContent(message: _message)
          ],
        );

      case StateRenderType.FULL_SCREEN_ERROR_STATE:
        return GetColumnWidget(
          children: [
            const GetImageContent(
              path: AssetsManager.error1Lottie,
            ),
            GetMessageContent(message: _message),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: 200,
              child: DefaultButton(
                text: StringsManager.retry,
                onClick: () {
                  if (state == StateRenderType.FULL_SCREEN_ERROR_STATE) {
                    retryActionFunction?.call();
                  } else {
                    Navigator.of(context).pop();
                  }
                },
              ),
            ),
          ],
        );

      case StateRenderType.CONTENT_SCREEN_STATE:
        return Container();

      case StateRenderType.EMPTY_SCREEN_STATE:
        return GetColumnWidget(
          children: [
            const GetImageContent(path: AssetsManager.emptyLottie),
            GetMessageContent(message: _message),
          ],
        );

      default:
        return Container();
    }
  }
}

class GetColumnWidget extends StatelessWidget {
  const GetColumnWidget({
    Key? key,
    required this.children,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }
}

class GetImageContent extends StatelessWidget {
  const GetImageContent({
    Key? key,
    required this.path,
  }) : super(key: key);

  final String path;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      path,
      width: MediaQuery.of(context).size.width * 0.18,
    );
  }
}

class GetMessageContent extends StatelessWidget {
  const GetMessageContent({Key? key, required this.message}) : super(key: key);

  final String message;
  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: ConfigColor.kBlackColor,
      ),
    );
  }
}
