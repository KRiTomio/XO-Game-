import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier {
  int gridSize = 3; 
  late List<List<String>> board;
  String currentPlayer = 'X';
  bool gameOver = false;
  String? winner;

  
  List<Map<String, dynamic>> gameHistory = [];

  GameProvider() {
    _initBoard();
  }

  void _initBoard() {
    board = List.generate(gridSize, (_) => List.filled(gridSize, ''));
    gameOver = false;
    winner = null;
    currentPlayer = 'X';
    notifyListeners();
  }

  void setGridSize(int size) {
    gridSize = size;
    _initBoard();
  }

  void makeMove(int row, int col) {
    if (board[row][col] == '' && !gameOver) {
      board[row][col] = currentPlayer;
      if (_checkWinner(row, col)) {
        gameOver = true;
        winner = currentPlayer;
        _saveGameHistory();  
      } else if (_isBoardFull()) {
        gameOver = true;
        winner = 'Draw';
        _saveGameHistory();  
      } else {
        currentPlayer = (currentPlayer == 'X') ? 'O' : 'X';
      }
      notifyListeners();
    }
  }

  bool _isBoardFull() {
    for (var row in board) {
      for (var cell in row) {
        if (cell.isEmpty) return false;
      }
    }
    return true;
  }

  bool _checkWinner(int row, int col) {
    String symbol = board[row][col];

    
    if (board[row].every((cell) => cell == symbol)) return true;

    
    if (board.every((r) => r[col] == symbol)) return true;

    
    if (row == col && List.generate(gridSize, (i) => board[i][i]).every((cell) => cell == symbol)) {
      return true;
    }

    
    if (row + col == gridSize - 1 &&
        List.generate(gridSize, (i) => board[i][gridSize - 1 - i]).every((cell) => cell == symbol)) {
      return true;
    }

    return false;
  }

  void resetGame() {
    _initBoard();
    gameHistory.clear();
  }

  void _saveGameHistory() {
    gameHistory.add({
      'board': List.from(board.map((row) => List.from(row))),
      'winner': winner,
      'gridSize': gridSize,
    });
  }
}
