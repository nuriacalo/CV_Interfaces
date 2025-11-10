import 'package:flutter/material.dart';
import 'package:t3_2/main.dart';

class ExpandableSection extends StatefulWidget {
  final String title;
  final List<Widget> children;

  const ExpandableSection({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  State<ExpandableSection> createState() => _ExpandableSectionState();
}

class _ExpandableSectionState extends State<ExpandableSection> {
  bool _isExpanded = false;

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shadowColor: primaryGreen.withAlpha(102),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      color: backgroundWhite,
      child: Column(
        children: [
          ListTile(
            title: Text(
              widget.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: contentDarkGrey,
              ),
            ),
            trailing: Icon(
              _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            ),
            onTap: _toggleExpand,
          ),
          if (_isExpanded)
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(children: widget.children),
            ),
        ],
      ),
    );
  }
}