import 'package:flutter/material.dart';
import 'package:habit_tracker/add_habit/widgets/add_habit_background.dart';
import 'package:habit_tracker/widgets/custom_shaped_dark_app_bar.dart';
import 'package:habit_tracker/widgets/styled_button.dart';

class AddHabitPage extends StatelessWidget {
  const AddHabitPage({
    Key? key,
    required this.navBack,
  }) : super(key: key);

  final VoidCallback navBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HabitTrackerAppBar(
        title: 'Add habit',
        onBackTapped: navBack,
      ),
      body: Stack(
        children: const [
          AddHabitBackground(),
          Padding(
            padding: EdgeInsets.only(
              top: 100,
              left: 30,
              right: 30,
            ),
            child: _AddHabitView(),
          ),
        ],
      ),
    );
  }
}

class _AddHabitView extends StatefulWidget {
  const _AddHabitView({Key? key}) : super(key: key);

  @override
  State<_AddHabitView> createState() => _AddHabitViewState();
}

class _AddHabitViewState extends State<_AddHabitView> {
  TextEditingController habitTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Habit title',
            style:
                Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18),
          ),
          const _SmallSpacer(),
          _WhiteRoundedContainer(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 3,
                horizontal: 15,
              ),
              child: TextField(
                controller: habitTitleController,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter Habit Title',
                  hintStyle: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
          ),
          const _MiddleSpacer(),
          Text(
            'Choose an Activity',
            style:
                Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18),
          ),
          const _SmallSpacer(),
          _WhiteRoundedContainer(
            height: 320,
            child: Container(),
          ),
          const _MiddleSpacer(),
          const Center(
            child: StyledButton(title: 'Add Habit'),
          ),
        ],
      ),
    );
  }
}

class _SmallSpacer extends StatelessWidget {
  const _SmallSpacer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 10);
  }
}

class _MiddleSpacer extends StatelessWidget {
  const _MiddleSpacer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 50);
  }
}

class _WhiteRoundedContainer extends StatelessWidget {
  const _WhiteRoundedContainer({
    Key? key,
    required this.height,
    required this.child,
  }) : super(key: key);

  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: child,
    );
  }
}
