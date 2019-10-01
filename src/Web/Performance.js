'use strict';

exports.clearMarks = function(performance) {
  return function() {
    return performance.clearMarks();
  };
};

exports.clearMeasures = function(performance) {
  return function() {
    return performance.clearMeasures();
  };
};

exports.clearResourceTimings = function(performance) {
  return function() {
    return performance.clearResourceTimings();
  };
};

exports._getEntriesByType = function(performance) {
  return function(type) {
    return function() {
      return performance.getEntriesByType(type);
    };
  };
};

exports.mark = function(performance) {
  return function(name) {
    return function() {
      return performance.mark(name);
    };
  };
};

exports._measure1 = function(performance) {
  return function(name) {
    return function() {
      return performance.measure(name);
    };
  };
};

exports._measure2 = function(performance) {
  return function(name) {
    return function(startMark) {
      return function() {
        return performance.measure(name, startMark);
      };
    };
  };
};

exports._measure3 = function(performance) {
  return function(name) {
    return function(startMark) {
      return function(endMark) {
        return function() {
          return performance.measure(name, startMark, endMark);
        };
      };
    };
  };
};

exports._measure4 = function(performance) {
  return function(name) {
    return function(endMark) {
      return function() {
        return performance.measure(name, undefined, endMark);
      };
    };
  };
};

exports.now = function(performance) {
  return function() {
    return performance.now();
  };
};
