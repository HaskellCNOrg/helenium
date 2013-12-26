{-# LANGUAGE RankNTypes #-}

module Test.Helenium.Element.Types where

import Control.Monad
import Test.WebDriver
import Data.Text (Text)

class Clickable a where
  click :: a -> WD ()

class Fillable a where
  -- | element -> Submit or not -> input value
  fill :: a -> Bool -> Text -> WD ()

class Viewable a where
  exists :: a -> WD Bool

-- TODO:
--instance forall a. Viewable a => Viewable [a] where
--existsAll :: forall a. Viewable a => [a] -> WD Bool
--existsAll xs = liftM and (mapM exists xs)
