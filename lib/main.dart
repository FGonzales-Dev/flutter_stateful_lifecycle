import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Stateful Widget Lifecycle')),
        body: WidgetVisibilityToggle(),
      ),
    );
  }
}

class WidgetVisibilityToggle extends StatefulWidget {
  @override
  _WidgetVisibilityToggleState createState() => _WidgetVisibilityToggleState();
}

class _WidgetVisibilityToggleState extends State<WidgetVisibilityToggle> {
  bool _isVisible = true;

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
      print(_isVisible
          ? 'LifecycleDemo is now visible'
          : 'LifecycleDemo has been removed from the tree');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: _toggleVisibility,
          child: Text(_isVisible ? 'Remove Widget' : 'Show Widget'),
        ),
        SizedBox(height: 20),
        _isVisible ? LifecycleDemo() : Container(),
      ],
    );
  }
}

class LifecycleDemo extends StatefulWidget {
  @override
  _LifecycleDemoState createState() {
    print(
        "1. createState() - Called once when the stateful widget is created.");
    return _LifecycleDemoState();
  }
}

class _LifecycleDemoState extends State<LifecycleDemo> {
  @override
  void initState() {
    super.initState();
    print(
        "2. initState() - Called once when the state object is first created.");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print(
        "3. didChangeDependencies() - Called when the dependencies of the widget change.");
  }

  @override
  Widget build(BuildContext context) {
    print("4. build() - Called whenever the widget needs to be rebuilt.");
    return Center(
      child:
          Text('Stateful Widget Lifecycle Demo', textAlign: TextAlign.center),
    );
  }

  @override
  void didUpdateWidget(covariant LifecycleDemo oldWidget) {
    super.didUpdateWidget(oldWidget);
    print(
        "5. didUpdateWidget() - Called when the widget configuration changes.");
  }

  @override
  void deactivate() {
    super.deactivate();
    print(
        "7. deactivate() - Called when the widget is removed from the tree but might be reinserted before the current frame ends.");
  }

  @override
  void dispose() {
    super.dispose();
    print(
        "8. dispose() - Called when the widget is permanently removed from the tree.");
  }
}
