# halogen-webpack-template

Minimal template for `webpack`-based PureScript Halogen projects.

This template is unopinionated about project architecture (single-page vs. multi-page), so it doesn't include routing for either approach. Instead, this template is opinionated towards certain stack choices which may or may not improve the developer experience. For instance:

* CSS modules over Tailwind or CSS-in-PureScript
  * CSS modules enable snappier iteration over Tailwind.css and CSS-in-PureScript since the app does not have to be fully reloaded for styles to be updated. This template uses [style-loader](https://github.com/webpack-contrib/style-loader) during development and [mini-css-extract-plugin](https://github.com/webpack-contrib/mini-css-extract-plugin) for production builds.
