import 'package:arm_fight_helper/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RoundsWidget extends ConsumerWidget {
  const RoundsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 90, 20, 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,

        children: [
          Container(
            width: 50,
            height: 13,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).extension<ThemeColors>()!.readyColor
            ),
          ),

          const SizedBox(width: 10),

          Row(
            children: [
              Container(
                width: 31,
                height: 31,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).extension<ThemeColors>()!.readyColor
                ),
              ),

              const SizedBox(width: 20),

              Container(
                width: 31,
                height: 31,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.onSurface
                ),
              ),
            ],


          ),

          const SizedBox(width: 10),
          Container(
            width: 50,
            height: 13,
            decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).extension<ThemeColors>()!.readyColor
            ),
          ),


        ],


      ),

    );
  }

}
