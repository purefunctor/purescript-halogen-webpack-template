module Utils.Css where

import Data.Function.Uncurried (Fn2, runFn2)
import Halogen.HTML.Properties as HP
import Web.HTML.Common (ClassName(..))

data CssStyles

foreign import getStyleImpl ∷ Fn2 CssStyles String String

className ∷ ∀ r i. CssStyles → String → HP.IProp (class ∷ String | r) i
className m n = HP.class_ (ClassName (runFn2 getStyleImpl m n))

infix 9 className as ##
