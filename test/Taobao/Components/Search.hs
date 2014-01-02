{-# LANGUAGE OverloadedStrings #-}

module Taobao.Components.Search where

import qualified Data.Text as T
import Test.WebDriver
import Test.WebDriver.Commands
import Test.WebDriver.Commands.Wait

import Test.Helenium

defaultWaitTime = 3000

searchInput :: Input
searchInput = input $ ById "q"

searchBtn :: Button
searchBtn = button $ ByCSS "button.btn-search"

-- | Whether the component is display (base on all its elements presents)
--
isDisplay :: WD Bool
isDisplay = waitUntil defaultWaitTime
            $ do
              i <- exists searchInput
              b <- exists searchBtn
              return (i && b)


doSearch :: T.Text -> WD ()
doSearch = fill searchInput True
