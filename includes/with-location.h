#if MIN_VERSION_base(4,8,1)
#define HAS_SOURCE_LOCATIONS
{-# LANGUAGE ImplicitParams #-}
#endif

#ifdef HAS_SOURCE_LOCATIONS

#define with_location (?loc :: CallStack) =>
#define with_location_imports import GHC.Stack (CallStack)

#else

#define with_location
#define with_location_imports

#endif
