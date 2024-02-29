import 'package:app/widegets.dart';
import 'package:flutter/material.dart';
import 'package:languagetool_textfield/languagetool_textfield.dart';

import 'Animation/FadeAnimation.dart';

/// Example App main page
class App extends StatefulWidget {
  /// Example app constructor
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  /// Initialize LanguageTool
  static final LanguageTool _languageTool = LanguageTool();

  /// Initialize DebounceLangToolService
  static final DebounceLangToolService _debouncedLangService =
      DebounceLangToolService(
    LangToolService(_languageTool),
    const Duration(milliseconds: 500),
  );

  /// Initialize ColoredTextEditingController
  final ColoredTextEditingController _controller =
      ColoredTextEditingController(languageCheckService: _debouncedLangService);

  int currentAlignmentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: mygradientContainer(
          pagename: 'Writting Practice',
          myContainer: Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      FadeAnimation(
                        1.4,
                          LanguageToolTextField(
                          style: const TextStyle(),
                          decoration: const InputDecoration(
                            hintText: 'Enter your text here',
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                          coloredController: _controller,
                          mistakePopup: MistakePopup(
                              popupRenderer: PopupOverlayRenderer()),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
