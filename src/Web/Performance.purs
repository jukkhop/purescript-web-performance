module Web.Performance
  ( Performance
  , clearMarks
  , clearMeasures
  , clearResourceTimings
  , getEntriesByType
  , mark
  , measure
  , measure'
  , measure''
  , measure'''
  , now
  , module Web.Performance.PerformanceEntry
  ) where

import Prelude
import Effect (Effect)
import Web.Performance.PerformanceEntry (ForeignPerformanceEntry, PerformanceEntry, PerformanceEntryType, fromForeign, print)

foreign import data Performance :: Type

foreign import clearMarks :: Performance -> Effect Unit

foreign import clearMeasures :: Performance -> Effect Unit

foreign import clearResourceTimings :: Performance -> Effect Unit

foreign import _getEntriesByType :: Performance -> String -> Effect (Array ForeignPerformanceEntry)

getEntriesByType :: Performance -> PerformanceEntryType -> Effect (Array PerformanceEntry)
getEntriesByType perf entryT = map fromForeign <$> (_getEntriesByType perf $ print entryT)

foreign import mark :: Performance -> String -> Effect Unit

foreign import _measure1 :: Performance -> String -> Effect Unit

-- | Corresponds to performance.measure(name)
measure :: Performance -> String -> Effect Unit
measure = _measure1

foreign import _measure2 :: Performance -> String -> String -> Effect Unit

-- | Corresponds to performance.measure(name, startMark)
measure' :: Performance -> String -> String -> Effect Unit
measure' = _measure2

foreign import _measure3 :: Performance -> String -> String -> String -> Effect Unit

-- | Corresponds to performance.measure(name, startMark, endMark)
measure'' :: Performance -> String -> String -> String -> Effect Unit
measure'' = _measure3

foreign import _measure4 :: Performance -> String -> String -> Effect Unit

-- | Corresponds to performance.measure(name, undefined, endMark)
measure''' :: Performance -> String -> String -> Effect Unit
measure''' = _measure4

foreign import now :: Performance -> Effect Number
