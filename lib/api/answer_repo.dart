import 'package:flutter_redux_setup/models/exports.dart';
import 'package:flutter_redux_setup/utils/exports.dart';

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
    final String answer =
        Di().getStore().state.missionState.getCurrentMission()?.answer ?? '';
    if (StringUtils.isNullOrEmpty(answer)) {
      throw Exception('Current Mission not found!');
    }

    if (answer.toLowerCase() == answerText.toLowerCase()) {
      return AnswerResultView(true, 'You got it!');
    }
    bool almostThere = false;
    String almostThereText = '';
    answerText.split(' ').forEach((_) {
      if (!StringUtils.isNullOrEmpty(_) &&
          answer.toLowerCase().contains(_.toLowerCase())) {
        almostThere = true;
        almostThereText = _;
        return;
      }
    });
    String hint = 'This answer does not look right.';

    if (almostThere) {
      hint = '$almostThereText is quite close but not close enought!';
    }

    return AnswerResultView(false, hint);
  }
}
