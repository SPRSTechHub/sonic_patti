import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sonic_patti/utils/constants.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  static const List<Color> colors = <Color>[
    Colors.yellow,
    Colors.orange,
    Colors.pink,
    Colors.purple,
    Colors.cyan,
  ];

  static final List<Widget> items = List<Widget>.generate(
    colors.length,
    (int index) => Container(color: colors[index], height: 150.0),
  ).reversed.toList();

  late ScrollController _controller;
  bool _isElevated = true;
  bool _isVisible = true;

  FloatingActionButtonLocation get _fabLocation => _isVisible
      ? FloatingActionButtonLocation.endDocked
      : FloatingActionButtonLocation.endFloat;

  void _listen() {
    final ScrollDirection direction = _controller.position.userScrollDirection;
    if (direction == ScrollDirection.forward) {
      _show();
    } else if (direction == ScrollDirection.reverse) {
      _hide();
    }
  }

  void _show() {
    if (!_isVisible) {
      setState(() => _isVisible = true);
    }
  }

  void _hide() {
    if (_isVisible) {
      setState(() => _isVisible = false);
    }
  }

  void _onElevatedChanged(bool value) {
    setState(() {
      _isElevated = value;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_listen);
  }

  @override
  void dispose() {
    _controller.removeListener(_listen);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom App Bar Demo'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              controller: _controller,
              children: items.toList(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        tooltip: 'Add New Item',
        elevation: _isVisible ? 0.0 : null,
        label: const Text('Add'),
        icon: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      bottomNavigationBar:
          _DemoBottomAppBar(isElevated: _isElevated, isVisible: _isVisible),
    );
  }
}

class _DemoBottomAppBar extends StatelessWidget {
  const _DemoBottomAppBar({
    required this.isElevated,
    required this.isVisible,
  });

  final bool isElevated;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: isVisible ? 80.0 : 0,
      child: BottomAppBar(
        elevation: isElevated ? null : 0.0,
        child: Row(
          children: <Widget>[
            IconButton(
              tooltip: 'Open popup menu',
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                final SnackBar snackBar = SnackBar(
                  content: const Text('Yay! A SnackBar!'),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {},
                  ),
                );

                // Find the ScaffoldMessenger in the widget tree
                // and use it to show a SnackBar.
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
            IconButton(
              tooltip: 'Search',
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Favorite',
              icon: const Icon(
                Icons.favorite,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
