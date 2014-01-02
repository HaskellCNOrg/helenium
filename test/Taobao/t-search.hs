{-# LANGUAGE OverloadedStrings #-}

module Main where

import           Control.Monad.IO.Class    (liftIO)
import           Test.WebDriver
import           Test.WebDriver.Commands

import qualified Taobao.Components.Search  as Search
import qualified Taobao.Pages.SearchResult as SR

url :: String
url = "http://www.taobao.com"

main :: IO ()
main = runSession defaultSession defaultCaps run


run :: WD ()
run = do
  openPage url
  s <- Search.isDisplay
  liftIO $ print s
  Search.doSearch "Hello Ketty"
  r <- SR.isDisplay
  liftIO $ print r
