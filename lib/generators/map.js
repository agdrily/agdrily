(function() {
  var MapGenerator, seedrandom, sodb;

  seedrandom = require('seedrandom');

  sodb = require('sodb');

  module.exports = MapGenerator = (function() {
    MapGenerator.prototype.rng = null;

    function MapGenerator(seed) {
      var i, j, k, l;
      this.seed = seed;
      this.rngseed = this.seed.slice(3, 7);
      this.rng = seedrandom(this.rngseed);
      this.map = new sodb;
      for (i = k = -3; k <= 2; i = ++k) {
        for (j = l = -3; l <= 2; j = ++l) {
          this.map.add(this.newLevelMap(i, j, 4, 13));
        }
      }
    }

    MapGenerator.prototype.newLevelMap = function(x, y, terrainStart, terrainStop) {
      var i, k, levelMap;
      levelMap = {
        x: x,
        y: y,
        levels: []
      };
      for (i = k = 0; k <= 19; i = ++k) {
        if (i < terrainStart || (i > terrainStop && i > 13)) {
          levelMap.levels[i] = 0;
        } else {
          if (i < 13 && i > 9 && terrainStop < i) {
            levelMap.levels[i] = 2;
          } else {
            levelMap.levels[i] = 1;
          }
        }
      }
      return levelMap;
    };

    return MapGenerator;

  })();

}).call(this);
