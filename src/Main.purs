module Main where

import Prelude

import Effect (Effect)
import Halogen.Aff as HA
import Halogen.VDom.Driver (runUI)
import Pages.Index as IndexPage

main ∷ Effect Unit
main = HA.runHalogenAff do
  body ← HA.awaitBody
  runUI IndexPage.component unit body
