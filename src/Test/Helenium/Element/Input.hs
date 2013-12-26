module Test.Helenium.Element.Input where

import Control.Monad (when)
import qualified Test.WebDriver as C
import qualified Test.WebDriver.Commands as C
import Test.Helenium.Element.Types

newtype Input = Input (C.WD C.Element)

input :: C.Selector -> Input
input = Input . C.findElem

instance Fillable Input where
  fill (Input wdElement) submit txt = do
    el <- wdElement
    C.clearInput el
    C.sendKeys txt el
    when submit $ C.submit el


instance Viewable Input where
  exists (Input el) = el >>= C.isDisplayed
