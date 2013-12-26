module Test.Helenium.Element.Button where

import qualified Test.WebDriver as C
import qualified Test.WebDriver.Commands as C
import Test.Helenium.Element.Types

newtype Button = Button (C.WD C.Element)

instance Clickable Button where
  click (Button el) = el >>= C.click

instance Viewable Button where
  exists (Button el) = el >>= C.isDisplayed

button :: C.Selector -> Button
button = Button . C.findElem
