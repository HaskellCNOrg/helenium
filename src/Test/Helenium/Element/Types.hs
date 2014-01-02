{-# LANGUAGE RankNTypes #-}

module Test.Helenium.Element.Types where


import qualified Test.WebDriver as C
import qualified Test.WebDriver.Commands as C

import Control.Monad
import Data.Text (Text)

class Clickable a where
  click :: a -> C.WD ()

class Fillable a where
  -- | element -> Submit or not -> input value
  fill :: a -> Bool -> Text -> C.WD ()

class Viewable a where
  exists :: a -> C.WD Bool

--------------------------------------------------

data Button = Button (C.WD C.Element)
data Input = Input (C.WD C.Element)

data WebEl a where
  button :: C.Selector -> WebEl Button
  input :: C.Selector -> WebEl Input

