module Web.Performance.PerformanceEntry where

import Prelude
import Data.Maybe (Maybe(Just, Nothing), fromMaybe)

type ForeignPerformanceEntry = {
  name :: String,
  entryType :: String,
  startTime :: Number,
  duration :: Number
}

type PerformanceEntry = {
  name :: String,
  entryType :: PerformanceEntryType,
  startTime :: Number,
  duration :: Number
}

data PerformanceEntryType
  = PerformanceMark
  | PerformanceMeasure
  | PerformanceFrameTiming
  | PerformanceNavigationTiming
  | PerformanceResourceTiming
  | PerformancePaintTiming
  | PerformanceLongTaskTiming

instance showEntryType :: Show PerformanceEntryType where
  show = print

fromForeign :: ForeignPerformanceEntry -> PerformanceEntry
fromForeign { name, entryType, startTime, duration } =
  {
    name,
    entryType: (fromMaybe PerformanceMark <<< parse) entryType,
    startTime,
    duration
  }

parse :: String -> Maybe PerformanceEntryType
parse =
  case _ of
    "mark" -> Just PerformanceMark
    "measure" -> Just PerformanceMeasure
    "frame" -> Just PerformanceFrameTiming
    "navigation" -> Just PerformanceNavigationTiming
    "resource" -> Just PerformanceResourceTiming
    "paint" -> Just PerformancePaintTiming
    "longtask" -> Just PerformanceLongTaskTiming
    _ -> Nothing

print :: PerformanceEntryType -> String
print =
  case _ of
    PerformanceMark -> "mark"
    PerformanceMeasure -> "measure"
    PerformanceFrameTiming -> "frame"
    PerformanceNavigationTiming -> "navigation"
    PerformanceResourceTiming -> "resource"
    PerformancePaintTiming -> "paint"
    PerformanceLongTaskTiming -> "longtask"
