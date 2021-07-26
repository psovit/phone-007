import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phone007/redux/mission_state/actions/unlock_screen.dart';
import 'package:phone007/utils/exports.dart';
import 'package:phone007/widgets/shake_x.dart';

class LockedScreen extends StatefulWidget {
  const LockedScreen({
    Key? key,
    required this.validCode,
    required this.hintText,
  }) : super(key: key);
  final String validCode;
  final String hintText;

  @override
  _LockedScreenState createState() => _LockedScreenState();
}

class _LockedScreenState extends State<LockedScreen> {
  String _enteredCode = '';

  void _enterCode(String code) {
    if (_enteredCode.length == 4) {
      return;
    }
    setState(() {
      _enteredCode = _enteredCode + code;
    });
  }

  void _deleteCode() {
    if (StringUtils.isNullOrEmpty(_enteredCode)) {
      return;
    }
    setState(() {
      _enteredCode = _enteredCode.substring(0, _enteredCode.length - 1);
    });
  }

  Key _shakerKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: PageView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Container(
            child: Center(
              child: Text(
                widget.hintText,
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    ?.copyWith(color: AppColors.white),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ShakeWidget(
                key: _shakerKey,
                child: Text(
                  _enteredCode,
                  style: const TextStyle(color: AppColors.white, fontSize: 26),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    onPressed: () => _enterCode('1'),
                    child: const Text(
                      '1',
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                  TextButton(
                    onPressed: () => _enterCode('2'),
                    child: const Text(
                      '2',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  TextButton(
                    onPressed: () => _enterCode('3'),
                    child: const Text(
                      '3',
                      style: TextStyle(fontSize: 26),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    onPressed: () => _enterCode('4'),
                    child: const Text(
                      '4',
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                  TextButton(
                    onPressed: () => _enterCode('5'),
                    child: const Text(
                      '5',
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                  TextButton(
                    onPressed: () => _enterCode('6'),
                    child: const Text(
                      '6',
                      style: TextStyle(fontSize: 26),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    onPressed: () => _enterCode('7'),
                    child: const Text(
                      '7',
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                  TextButton(
                    onPressed: () => _enterCode('8'),
                    child: const Text(
                      '8',
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                  TextButton(
                    onPressed: () => _enterCode('9'),
                    child: const Text(
                      '9',
                      style: TextStyle(fontSize: 26),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    onPressed: _deleteCode,
                    child: const Icon(Icons.backspace),
                  ),
                  TextButton(
                    onPressed: () => _enterCode('0'),
                    child: const Text(
                      '0',
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (_enteredCode.trim() == widget.validCode.trim()) {
                        Di().getStore().dispatch(UnlockScreen());
                      }
                      setState(() {
                        _shakerKey = UniqueKey();
                      });
                      HapticFeedback.heavyImpact();
                    },
                    child: const Icon(Icons.check),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
