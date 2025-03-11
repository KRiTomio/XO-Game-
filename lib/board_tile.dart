import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'game_provider.dart';

class BoardTile extends StatelessWidget {
  final int row;
  final int col;

  const BoardTile({super.key, required this.row, required this.col});

  @override
  Widget build(BuildContext context) {
    final game = Provider.of<GameProvider>(context);

    return GestureDetector(
      onTap: () => game.makeMove(row, col),
      child: Container(
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.blueGrey[800],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            game.board[row][col],
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
