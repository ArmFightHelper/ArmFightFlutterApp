import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PauseButtonWidget extends ConsumerWidget {
  const PauseButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
      child: RawMaterialButton(
        onPressed: () {},
        elevation: 2.0,
        fillColor: Theme.of(context).colorScheme.secondary,
        padding: const EdgeInsets.all(15.0),
        shape: const CircleBorder(),
        child: Icon(
          color: Theme.of(context).colorScheme.onSecondary,
          Icons.pause_rounded,
          size: 40.0,
        ),
      ),
    );
  }



}