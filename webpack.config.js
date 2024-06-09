const path = require("path");
const HtmlWebpackPlugin = require("html-webpack-plugin");
const MiniCssExtractPlugin = require("mini-css-extract-plugin");

module.exports = (_env, argv) => {
  const dev = argv.mode === "development";
  return {
    mode: argv.mode,
    entry: {
      index: dev ? "./index-dev.js" : "./index-prod.js",
    },
    devServer: {
      compress: false,
      port: 8000,
    },
    devtool: dev ? "inline-source-map" : "source-map",
    plugins: [ 
      new HtmlWebpackPlugin({
        title: "Hello Halogen",
        meta: {
          viewport: "width=device-width, initial-scale=1.0",
        },
      }),
      new MiniCssExtractPlugin({
        filename: "[name].[contenthash].css",
      }),
    ],
    module: {
      rules: [
        {
          test: /\.css$/i,
          use: [
            dev ? "style-loader" : MiniCssExtractPlugin.loader,
            {
              loader: "css-loader", 
              options: {
                modules: {
                  mode: "local",
                  localIdentName: "[path][name]-[local]",
                }
              },
            },
          ],
        },
      ],
    },
    resolve: {
      alias: {
        css: path.resolve(__dirname, "css"),
      },
    },
    output: {
      filename: "[name].[contenthash].js",
      path: path.resolve(__dirname, "dist"),
      clean: true,
    }
  };
};
