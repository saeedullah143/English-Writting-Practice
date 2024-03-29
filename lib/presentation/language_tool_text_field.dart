import 'package:flutter/material.dart';
import 'package:languagetool_textfield/core/controllers/colored_text_editing_controller.dart';
import 'package:languagetool_textfield/utils/mistake_popup.dart';

/// A TextField widget that checks the grammar using the given
/// [coloredController]
class LanguageToolTextField extends StatefulWidget {
  /// A style to use for the text being edited.
  final TextStyle style;

  /// A decoration of this [TextField].
  final InputDecoration decoration;

  /// Color scheme to highlight mistakes
  final ColoredTextEditingController coloredController;

  /// Mistake popup window
  final MistakePopup mistakePopup;

  /// The maximum number of lines to show at one time, wrapping if necessary.
  final int maxLines;

  /// The minimum number of lines to occupy when the content spans fewer lines.
  final int minLines;

  /// Whether this widget's height will be sized to fill its parent.
  final bool expands;

  /// Creates a widget that checks grammar errors.
  const LanguageToolTextField({
    required this.style,
    required this.decoration,
    required this.coloredController,
    required this.mistakePopup,
    this.maxLines = 12, // Set your desired default values here
    this.minLines = 1, // Set your desired default values here
    this.expands = false,
    Key? key,
  });


  @override
  State<LanguageToolTextField> createState() => _LanguageToolTextFieldState();
}

class _LanguageToolTextFieldState extends State<LanguageToolTextField> {
  @override
  void initState() {
    widget.coloredController.showPopup = widget.mistakePopup.show;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            controller: widget.coloredController,
            style: widget.style,
            decoration: widget.decoration,
            minLines: widget.minLines,
            maxLines: widget.maxLines,
            expands: widget.expands,
          ),
        ),
      ],
    );
  }
}
