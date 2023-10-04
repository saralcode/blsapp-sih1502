import 'package:flutter/material.dart';

Widget formContextMenu(
    BuildContext context, EditableTextState editableTextState) {
  return AdaptiveTextSelectionToolbar.editableText(
    editableTextState: editableTextState,
  );
}
