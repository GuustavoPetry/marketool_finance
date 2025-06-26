import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class TutorialController {
  final BuildContext context;
  final GlobalKey uploadKey;
  final GlobalKey patrimonyKey;
  final GlobalKey homePageKey;

  TutorialController({
    required this.context,
    required this.uploadKey,
    required this.patrimonyKey,
    required this.homePageKey,
  });

  late TutorialCoachMark tutorialCoachMark;

  void startTutorial() {
    final targets = _createTargets()
        .where((t) => t.keyTarget?.currentContext != null)
        .toList();

    if (targets.isEmpty) {
      debugPrint("Nenhum Widget está renderizado ainda. TUTORIAL ABORTADO.");
      return;
    }

    tutorialCoachMark = TutorialCoachMark(
      targets: targets,
      colorShadow: Colors.black,
      textSkip: "> Continuar <",
      paddingFocus: 10,
      opacityShadow: 0.8,
    )..show(context: context);
  }

  List<TargetFocus> _createTargets() {
    return [
      TargetFocus(
        identify: "uploadKey",
        keyTarget: uploadKey,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: Text(
              "Seção para importar Notas de Corretagem",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      TargetFocus(
        identify: "patrimonyKey",
        keyTarget: patrimonyKey,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: Text(
              "Seção para visualizar patrimônio em gráfico",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      TargetFocus(
        identify: "homePageKey",
        keyTarget: homePageKey,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: Text(
              "Página Inicial com Painel de Controle da Carteira",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    ];
  }
}
