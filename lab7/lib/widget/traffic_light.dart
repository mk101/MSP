import 'package:flutter/material.dart';

class TrafficLightController {
  final int redTime;
  final int yellowTime;
  final int greenTime;

  final List<void Function()> _startListeners = [];
  final List<void Function()> _endListeners = [];

  TrafficLightController({
    required this.redTime,
    required this.yellowTime,
    required this.greenTime
  });

  void start() {
    for (var foo in _startListeners) {
      foo();
    }
  }

  void stop() {
    for (var foo in _endListeners) {
      foo();
    }
  }

  void addStartListener(void Function() foo) {
    _startListeners.add(foo);
  }

  void addEndListener(void Function() foo) {
    _endListeners.add(foo);
  }

  void removeStartListener(void Function() foo) {
    _startListeners.remove(foo);
  }

  void removeEndListener(void Function() foo) {
    _endListeners.remove(foo);
  }
}

class TrafficLight extends StatefulWidget {

  const TrafficLight({
    Key? key,
    this.redColor = Colors.red,
    this.yellowColor = Colors.yellow,
    this.greenColor = Colors.green,
    this.blackColor = Colors.black54,
    required this.trafficLightController,
    required this.onGreenStart,
    required this.onGreedEnd,
  }) : super(key: key);

  final Color redColor;
  final Color yellowColor;
  final Color greenColor;
  final Color blackColor;

  final void Function() onGreenStart;
  final void Function() onGreedEnd;

  final TrafficLightController trafficLightController;

  @override
  State<TrafficLight> createState() => _TrafficLightState();
}

class _TrafficLightState extends State<TrafficLight> with TickerProviderStateMixin {
  late AnimationController _redController;
  late AnimationController _yellowController;
  late AnimationController _greenController;

  int currentState = 0;

  late Color _red;
  late Color _yellow;
  late Color _green;

  late void Function() _start;
  late void Function() _end;

  @override
  void initState() {
    super.initState();

    _start = () {
      currentState = 0;
      _redController.stop();
      _yellowController.stop();
      _greenController.stop();

      _redController.forward(from: 0);
    };

    _end = () {
      switch(currentState) {
        case 0:
          _redController.stop();
          break;
        case 1:
          _yellowController.stop();
          break;
        case 2:
          _greenController.stop();
          break;
      }
    };

    _red = widget.blackColor;
    _yellow = widget.blackColor;
    _green = widget.blackColor;

    _redController = AnimationController(vsync: this, duration: Duration(seconds: widget.trafficLightController.redTime));
    _yellowController = AnimationController(vsync: this, duration: Duration(seconds: widget.trafficLightController.yellowTime));
    _greenController = AnimationController(vsync: this, duration: Duration(seconds: widget.trafficLightController.greenTime));

    widget.trafficLightController.addStartListener(_start);
    widget.trafficLightController.addEndListener(_end);

    _redController.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        setState(() {
          currentState = 1;
          _red = widget.redColor;
          _yellow = widget.blackColor;
          _green = widget.blackColor;
        });

        return;
      }

      if (status == AnimationStatus.completed) {
        _yellowController.forward(from: 0);
      }
    });

    _yellowController.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        setState(() {
          currentState = 2;
          _red = widget.blackColor;
          _yellow = widget.yellowColor;
          _green = widget.blackColor;
        });

        return;
      }

      if (status == AnimationStatus.completed) {
        _greenController.forward(from: 0);
      }
    });

    _greenController.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        setState(() {
          currentState = 3;
          _red = widget.blackColor;
          _yellow = widget.blackColor;
          _green = widget.greenColor;
        });

        widget.onGreenStart();

        return;
      }

      if (status == AnimationStatus.completed) {
        widget.onGreedEnd();
        _redController.forward(from: 0);
      }
    });
  }


  @override
  void dispose() {
    super.dispose();

    _redController.dispose();
    _yellowController.dispose();
    _greenController.dispose();

    widget.trafficLightController.removeStartListener(_start);
    widget.trafficLightController.removeEndListener(_end);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 3.0),
          child: Container(
            decoration: BoxDecoration(
              color: _red,
              shape: BoxShape.circle
            ),
            width: 30,
            height: 30,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 3.0),
          child: Container(
            decoration: BoxDecoration(
                color: _yellow,
                shape: BoxShape.circle
            ),
            width: 30,
            height: 30,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: _green,
              shape: BoxShape.circle
          ),
          width: 30,
          height: 30,
        ),
      ],
    );
  }
}
