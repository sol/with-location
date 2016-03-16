{-# LANGUAGE CPP #-}
module Data.WithLocationSpec (spec) where

import           Test.Hspec

import           Data.WithLocation

spec :: Spec
spec = do
  describe "location" $ do
    it "returns a source location" $ do
#if MIN_VERSION_base(4,8,1)
      location `shouldBe` Just (Location "main" "Data.WithLocationSpec" __FILE__ __LINE__ 7)
#else
      location `shouldBe` Nothing
#endif
