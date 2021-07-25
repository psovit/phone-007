import 'package:phone007/models/exports.dart';
import 'package:phone007/utils/exports.dart';

abstract class AnswerRepository {
  Future<AnswerResultView> checkAnswer(int missionId, String answerText);
}

class AnswerApi implements AnswerRepository {
  @override
  Future<AnswerResultView> checkAnswer(int missionId, String answerText) async {
    if (StringUtils.isNullOrEmpty(answerText)) {
      return AnswerResultView(false, 'This answer does not look right.');
    }
    await Future<void>.delayed(const Duration(seconds: 2));
    return _checkResultForMission(answerText);
  }

  AnswerResultView _checkResultForMission(String answerText) {
    final List<String> possibleAnswers = Di()
            .getStore()
            .state
            .missionState
            .getCurrentMission()
            ?.possibleAnswers ??
        <String>[];
    if (possibleAnswers.isEmpty) {
      throw Exception('Current Mission not found!');
    }

    bool foundAnswer = false;

    possibleAnswers.forEach((_) {
      if (_.toLowerCase() == answerText.replaceAll(',', '').toLowerCase()) {
        foundAnswer = true;
        return;
      }
    });

    if (foundAnswer) {
      return AnswerResultView(true, 'Congratulations 🎉 You got it! 🎉');
    }

    bool almostThere = false;
    String almostThereText = '';
    answerText.split(' ').forEach((_) {
      if (!StringUtils.isNullOrEmpty(_) &&
          possibleAnswers.join(' ').toLowerCase().contains(_.toLowerCase())) {
        almostThere = true;
        almostThereText = _;
        return;
      }
    });
    String hint = 'This answer does not look right.';

    if (almostThere) {
      hint = '$almostThereText is quite close but not close enough!';
    }

    return AnswerResultView(false, hint);
  }
}
