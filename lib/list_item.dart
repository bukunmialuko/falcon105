import 'package:flutter/material.dart';

import 'circle_painter.dart';
import 'curve_wave.dart';

class ListItem extends StatefulWidget {
  const ListItem({
    Key key,
    this.size = 80.0,
    this.color = Colors.red,
    this.onPressed,
    @required this.child,
  }) : super(key: key);

  final double size;
  final Color color;
  final Widget child;
  final VoidCallback onPressed;

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> with TickerProviderStateMixin {
// class ListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        animateThen();
      },
      child: ClipRect(
        child: IntrinsicHeight(
          child: Container(
            child: Stack(
              children: [
                Container(
                  child: CustomPaint(
                    painter: CirclePainter(
                      _controller,
                      color: widget.color,
                    ),
                    child: SizedBox(
                      // width: widget.size * 4.125,
                      // height: widget.size * 4.125,
                      child: _button(),
                    ),
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(8.0),
                )),
                Container(
                  // color: Colors.green,
                  child: ListTile(
                    enabled: false,
                    leading: ListItemLeadingColor(),
                    title: Transform.translate(
                      offset: Offset(-12, 0),
                      child: Text(
                        "Home",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    trailing: ListItemTrailing(),
                    onTap: () {},
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void animateThen() {}

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _button() {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: <Color>[
                widget.color,
                Color.lerp(widget.color, Colors.black, .05)
              ],
            ),
          ),
          child: ScaleTransition(
              scale: Tween(begin: 0.95, end: 1.0).animate(
                CurvedAnimation(
                  parent: _controller,
                  curve: const CurveWave(),
                ),
              ),
              child: Icon(
                Icons.speaker_phone,
                size: 20,
              )),
        ),
      ),
    );
  }
}

class ListItemLeadingColor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      child: Center(
          child: Icon(
        Icons.home,
        color: Colors.green,
      )),
    );
  }
}

class ListItemLeadingIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      child: Center(
          child: Icon(
        Icons.home,
        color: Colors.red,
      )),
    );
  }
}

class ListItemTrailing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: new BoxConstraints(
          maxHeight: 30.0,
          minHeight: 30.0,
          minWidth: 30.0,
        ),
        child: IntrinsicWidth(
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Center(
              child: Text(
                "12",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ));
  }
// @override
// Widget build(BuildContext context) {
//   return Row(
//     mainAxisSize: MainAxisSize.max,
//     m
//     children: [
//     Container(
//     width: 30,
//     height: 30,
//     decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.1),
//         borderRadius: BorderRadius.all(Radius.circular(8))),
//     child: Center(
//         child: Text(
//           "12",
//           style: TextStyle(fontSize: 16, color: Colors.white),
//         )),
//   );
//     ],
//   );
// }
}
