{-# LANGUAGE OverloadedStrings #-}

module Taobao.Pages.SearchResult where

import qualified Data.Text as T
import Test.WebDriver
import Test.WebDriver.Commands
import Test.WebDriver.Commands.Wait

import Test.Helenium

defaultWaitTime = 3000

items :: WD [Element]
items = findElems $ ByCSS "div.item"

-- | Whether the component is display (base on all its elements presents)
--
isDisplay :: WD Bool
isDisplay = waitUntil defaultWaitTime
            $ do
              xs <- items
              --liftIO $ print "Find search result " ++ (length xs)
              return $ length xs > 0
