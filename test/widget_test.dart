// Tests for the Align widget demo: the dropdown should hold all nine
// positions and move the single child to whichever one is picked.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:align_widget/main.dart';

AlignmentGeometry childAlignment(WidgetTester tester) {
  return tester.widget<AnimatedAlign>(find.byType(AnimatedAlign)).alignment;
}

/// Opens the position dropdown and taps the entry with [label].
Future<void> pickPosition(WidgetTester tester, String label) async {
  await tester.tap(find.byType(DropdownButton<Alignment>));
  await tester.pumpAndSettle();
  await tester.tap(find.text(label).last);
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('starts with the child centered', (WidgetTester tester) async {
    await tester.pumpWidget(const AlignWidgetApp());

    expect(childAlignment(tester), Alignment.center);
  });

  testWidgets('dropdown lists all nine positions', (WidgetTester tester) async {
    await tester.pumpWidget(const AlignWidgetApp());

    await tester.tap(find.byType(DropdownButton<Alignment>));
    await tester.pumpAndSettle();

    const List<String> labels = <String>[
      'topLeft',
      'topCenter',
      'topRight',
      'centerLeft',
      'center',
      'centerRight',
      'bottomLeft',
      'bottomCenter',
      'bottomRight',
    ];

    for (final String label in labels) {
      expect(
        find.text(label),
        findsWidgets,
        reason: 'dropdown is missing the "$label" option',
      );
    }
  });

  testWidgets('picking a position moves the child there', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const AlignWidgetApp());

    await pickPosition(tester, 'bottomRight');
    expect(childAlignment(tester), Alignment.bottomRight);

    await pickPosition(tester, 'topLeft');
    expect(childAlignment(tester), Alignment.topLeft);
  });
}
