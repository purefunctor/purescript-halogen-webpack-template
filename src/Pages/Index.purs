module Pages.Index where

import Prelude

import Halogen (HalogenM)
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Events as HE
import Halogen.HTML.Properties as HP
import Utils.Css (CssStyles, (##))

foreign import styles ∷ CssStyles

type State =
  { count ∷ Int
  }

data Action
  = Increment
  | Decrement

initialState ∷ ∀ i. i → State
initialState _ = { count: 0 }

render ∷ ∀ s m. State → H.ComponentHTML Action s m
render { count } =
  HH.main [ styles ## "content" ]
    [ HH.h1_ [ HH.text "Halogen Webpack Template" ]
    , HH.div [ styles ## "container" ]
        [ HH.button
            [ styles ## "button"
            , HE.onClick \_ → Decrement
            , HP.title "Decrease"
            ]
            [ HH.text "-" ]
        , HH.span_ [ HH.text $ show count ]
        , HH.button
            [ styles ## "button"
            , HE.onClick \_ → Increment
            , HP.title "Increase"
            ]
            [ HH.text "+" ]
        ]
    ]

handleAction ∷ ∀ s o m. Action → HalogenM State Action s o m Unit
handleAction = do
  let
    increment { count } = { count: count + 1 }
    decrement { count } = { count: count - 1 }
  case _ of
    Increment → do
      H.modify_ increment
    Decrement → do
      H.modify_ decrement

component ∷ ∀ q i o m. H.Component q i o m
component =
  H.mkComponent
    { initialState
    , render
    , eval: H.mkEval $ H.defaultEval { handleAction = handleAction }
    }
