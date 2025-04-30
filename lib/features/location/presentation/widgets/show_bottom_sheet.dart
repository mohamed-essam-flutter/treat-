import 'package:flutter/material.dart';
import 'package:treat/core/widgets/custom_icon.dart';

class ShowBottomSheet extends StatelessWidget {
  const ShowBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomIcon(
          imagePath: 'assets/icons/Logo.svg',
          isColorContainer: false,
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  height: 200,
                  color: Colors.white,
                  child: Center(
                    child: Text('Hello from the bottom sheet!'),
                  ),
                );
              },
            );
          },
          child: const Text('Show Bottom Sheet'),
        ),
      ),
    );
  }
}