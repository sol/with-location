{-# LANGUAGE CPP #-}
#include "with-location.h"
module Data.WithLocation where

#ifdef HAS_SOURCE_LOCATIONS
#if !(MIN_VERSION_base(4,9,0))
import           GHC.SrcLoc
#endif
import           GHC.Stack
#endif

data Location = Location {
  locationPackage :: String
, locationModule :: String
, locationFile :: FilePath
, locationLine :: Int
, locationColumn :: Int
} deriving (Eq, Ord, Show)

location :: with_location Maybe Location
#ifdef HAS_SOURCE_LOCATIONS
location = case reverse (getCallStack ?loc) of
  (_, loc) : _ -> Just $ Location (srcLocPackage loc) (srcLocModule loc) (srcLocFile loc) (srcLocStartLine loc) (srcLocStartCol loc)
  [] -> Nothing
#else
location = Nothing
#endif
