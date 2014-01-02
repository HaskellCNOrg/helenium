{-# LANGUAGE OverloadedStrings #-}

module StubHub.Components.Search where

import Test.WebDriver
import Test.WebDriver.Commands
import Test.WebDriver.Commands.Wait

import Test.Helenium

defaultWaitTime = 3000

searchInput :: Input
searchInput = input $ ById "searchStr"

searchBtn :: Button
searchBtn = button $ ById "srchbtn"

-- | Whether the component is display (base on all its elements presents)
--
isDisplay :: WD Bool
isDisplay = waitUntil defaultWaitTime
            $ do
              i <- exists searchInput
              b <- exists searchBtn
              return (i && b)
