class GameOfLife {
  List<List<int>> _matrix;
  final int height;
  final int width;
  
  GameOfLife(this._matrix) 
    : height = _matrix.length,
      width = _matrix.isEmpty ? 0 : _matrix[0].length;
  
  void tick() {
    if (_matrix.isNotEmpty) {
      int cellAt(x,y) {
        if (x < 0 || y < 0 || x >= height || y >= width) {
          return 0;
        };
        return _matrix[x][y];
      }
      List<List<int>> result = [];
      for (int x = 0; x < height; x++) {
        List<int> row = [];
        for (int y = 0; y < width; y++) {
          int neighbors = 0;
          for (int dx = -1; dx <= 1; dx++) {
            for (int dy = -1; dy <= 1; dy++) {
              if (dy != 0 || dx != 0) {
                neighbors += cellAt(x+dx,y+dy);
              }
            }
          }
          int newCell = cellAt(x,y);
          if (neighbors == 3) {
            newCell = 1;
          }
          else if (neighbors > 3 || neighbors < 2) {
            newCell = 0;
          }
          row.add(newCell);
        }
        result.add(row);
      }
      _matrix = result;
    }
  }

  matrix() {
    return _matrix;
  }
}
