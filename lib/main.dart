import 'package:flutter/material.dart';

void main() {
  runApp(const AlignWidgetApp());
}

class AlignWidgetApp extends StatelessWidget {
  const AlignWidgetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AlignWidgetScreen(),
    );
  }
}

/// Demonstrates [Align] with a single child.
///
/// The child is wrapped in one align widget that fills the whole bordered box.
/// Picking a position from the dropdown changes the alignment, so the same
/// child slides to that spot.
class AlignWidgetScreen extends StatefulWidget {
  const AlignWidgetScreen({super.key});

  @override
  State<AlignWidgetScreen> createState() => _AlignWidgetScreenState();
}

class _AlignWidgetScreenState extends State<AlignWidgetScreen> {
  // The position the child currently sits at - center to start with.
  _AlignOption _selected = _options[4];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Align Widget Demo')),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Row(
              children: <Widget>[
                const Text(
                  'Position:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: DropdownButton<Alignment>(
                    isExpanded: true,
                    value: _selected.alignment,
                    onChanged: (Alignment? value) {
                      if (value == null) return;
                      setState(() {
                        _selected = _options.firstWhere(
                          (_AlignOption option) => option.alignment == value,
                        );
                      });
                    },
                    items: <DropdownMenuItem<Alignment>>[
                      for (final _AlignOption option in _options)
                        DropdownMenuItem<Alignment>(
                          value: option.alignment,
                          child: Text(option.label),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              // This box fills the space above; the child is placed inside it.
              // AnimatedAlign is just Align plus a smooth transition - swap it
              // for a plain Align if you want the child to jump instantly.
              child: AnimatedAlign(
                alignment: _selected.alignment,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                child: _badge(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// The single child that gets moved around.
  Widget _badge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: _selected.color,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Icon(Icons.star, color: Colors.white, size: 18),
          const SizedBox(width: 8),
          Text(
            _selected.label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

/// One entry of the position dropdown.
class _AlignOption {
  const _AlignOption(this.alignment, this.label, this.color);

  final Alignment alignment;
  final String label;
  final Color color;
}

const List<_AlignOption> _options = <_AlignOption>[
  _AlignOption(Alignment.topLeft, 'topLeft', Colors.red),
  _AlignOption(Alignment.topCenter, 'topCenter', Colors.deepOrange),
  _AlignOption(Alignment.topRight, 'topRight', Colors.orange),
  _AlignOption(Alignment.centerLeft, 'centerLeft', Colors.brown),
  _AlignOption(Alignment.center, 'center', Colors.green),
  _AlignOption(Alignment.centerRight, 'centerRight', Colors.teal),
  _AlignOption(Alignment.bottomLeft, 'bottomLeft', Colors.blue),
  _AlignOption(Alignment.bottomCenter, 'bottomCenter', Colors.indigo),
  _AlignOption(Alignment.bottomRight, 'bottomRight', Colors.purple),
];
