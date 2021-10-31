import 'dart:async';

class Debounce{
  bool haveCall = false;
  int debounceTimeInmilliseconds;
  Timer? _timer;

  Debounce({required this.debounceTimeInmilliseconds});

  run(Function callback) {

    if(haveCall && _timer != null){
      _timer?.cancel();
      _timer = Timer(Duration(milliseconds: debounceTimeInmilliseconds), callback as Function() );
      haveCall = true;
    }

    if(haveCall == false){
      _timer = Timer(Duration(milliseconds: debounceTimeInmilliseconds), callback as Function() );
      haveCall = true;
    }
  }
}
