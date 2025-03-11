import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'game_provider.dart';
import 'board_tile.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final game = Provider.of<GameProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('XO Game')),
      body: Column(
        children: [
          
          DropdownButton<int>(
            value: game.gridSize,
            items: [3, 4, 5, 6].map((size) {
              return DropdownMenuItem(
                value: size,
                child: Text('$size x $size'),
              );
            }).toList(),
            onChanged: (size) {
              if (size != null) game.setGridSize(size);
            },
          ),
          const SizedBox(height: 10),

          
          Text(
            game.winner == null ? 'Current Player: ${game.currentPlayer}' : 'Winner: ${game.winner}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: game.gridSize,
              ),
              itemCount: game.gridSize * game.gridSize,
              itemBuilder: (context, index) {
                int row = index ~/ game.gridSize;
                int col = index % game.gridSize;
                return BoardTile(row: row, col: col);
              },
            ),
          ),

          
          ElevatedButton(
            onPressed: game.resetGame,
            child: const Text('Restart Game'),
          ),

          const SizedBox(height: 20),

          
          const Divider(),
          const Text(
            'Game History:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: game.gameHistory.length,
              itemBuilder: (context, index) {
                var history = game.gameHistory[index];
                return ListTile(
                  title: Text('Game ${index + 1}'),
                  subtitle: Text('Winner: ${history['winner']} | Grid: ${history['gridSize']}x${history['gridSize']}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
