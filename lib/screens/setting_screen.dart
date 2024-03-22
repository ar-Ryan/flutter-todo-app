import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          // Notifications setting
          ListTile(
            title: Text('Notifications'),
            trailing: SliderButton(
              activeColor: Colors.blue,
              inactiveColor: Colors.grey,
              value: true, // Initial value (can be replaced with a variable)
            ),
          ),
          // Sound setting
          ListTile(
            title: Text('Sound'),
            trailing: SliderButton(
              activeColor: Colors.green,
              inactiveColor: Colors.grey,
              value: false, // Initial value (can be replaced with a variable)
            ),
          ),
          // Sort by closest setting
          ListTile(
            title: Text('Sort by Closest'),
            trailing: SliderButton(
              activeColor: Colors.orange,
              inactiveColor: Colors.grey,
              value: true, // Initial value (can be replaced with a variable)
            ),
          ),
        ],
      ),
    );
  }
}

class SliderButton extends StatelessWidget {
  final Color activeColor;
  final Color inactiveColor;
  final bool value;

  const SliderButton({
    required this.activeColor,
    required this.inactiveColor,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.7,
      child: Material(
        child: Switch(
          value: value,
          activeColor: activeColor, // Assuming you have a value for this
          trackColor: MaterialStateProperty.all(Colors.grey.shade200),
          onChanged: (newValue) => {},
        ),
      ),
    );
  }
}
