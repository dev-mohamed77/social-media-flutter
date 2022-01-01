// ignore_for_file: unnecessary_this, camel_case_extensions

import 'package:flutter/material.dart';
import 'package:socailmedia/core/base_manager/common/state_render.dart';
import 'package:socailmedia/core/utils/strings_manager.dart';

abstract class FlowState {
  StateRenderType getStateRenderType();
  String getMessage();
}

class LoadingState extends FlowState {
  StateRenderType stateRenderType;
  String message;
  LoadingState({
    required this.stateRenderType,
    required this.message,
  });

  @override
  String getMessage() => message;

  @override
  StateRenderType getStateRenderType() => stateRenderType;
}

class ErrorState extends FlowState {
  StateRenderType stateRenderType;
  String message;
  ErrorState({
    required this.stateRenderType,
    required this.message,
  });
  @override
  String getMessage() => message;

  @override
  StateRenderType getStateRenderType() => stateRenderType;
}

class ContentState extends FlowState {
  @override
  String getMessage() => StringsManager.empty;

  @override
  StateRenderType getStateRenderType() => StateRenderType.CONTENT_SCREEN_STATE;
}

class EmptyState extends FlowState {
  @override
  String getMessage() => StringsManager.empty;

  @override
  StateRenderType getStateRenderType() => StateRenderType.EMPTY_SCREEN_STATE;
}

extension stateRender on FlowState {
  Widget getScreenWidget({
    required BuildContext context,
    required Widget contentScreenWidget,
    required Function retryActionFunction,
  }) {
    switch (this.runtimeType) {
      case LoadingState:
        {
          if (getStateRenderType() == StateRenderType.POPUP_LOADING_STATE) {
            // show dialog loading
            showPopUp(context, getMessage(), getStateRenderType());

            return contentScreenWidget;
          } else {
            // StateRenderTypr.FULL_SCREEN_LOADING_STATE
            return StateRender(
              state: getStateRenderType(),
              retryActionFunction: retryActionFunction,
              message: getMessage(),
            );
          }
        }

      case ErrorState:
        {
          dismissDialog(context);
          if (getStateRenderType() == StateRenderType.POPUP_ERROR_STATE) {
            // show PopUp Dialog
            showPopUp(context, getMessage(), getStateRenderType());

            return contentScreenWidget;
          } else {
            return StateRender(
              state: getStateRenderType(),
              message: getMessage(),
              retryActionFunction: retryActionFunction,
            );
          }
        }
      case ContentState:
        {
          dismissDialog(context);
          return contentScreenWidget;
        }
      case EmptyState:
        {
          return StateRender(
            state: getStateRenderType(),
            message: getMessage(),
            retryActionFunction: retryActionFunction,
          );
        }
      default:
        {
          return contentScreenWidget;
        }
    }
  }

  void showPopUp(
    BuildContext context,
    String message,
    StateRenderType stateRenderType,
  ) {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      showDialog(
        context: context,
        builder: (context) {
          return StateRender(
            state: stateRenderType,
            message: message,
            retryActionFunction: () {},
          );
        },
      );
    });
  }

  dismissDialog(BuildContext context) {
    if (_isThereCurrentDialogShow(context)) {
      Navigator.of(context, rootNavigator: true).pop(true);
    }
  }

  _isThereCurrentDialogShow(context) =>
      ModalRoute.of(context)?.isCurrent != true;
}
