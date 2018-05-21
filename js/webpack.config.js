const path = require('path');

module.exports = {
    entry: './web/scripts/gallery-bundle-dev.js',
    output: {
        path: path.resolve(__dirname, 'web/scripts/'),
        filename: 'gallery-bundle.js'
    },
    watch: true,
    devtool: 'source-map',
    module: {
        loaders: [
            {
                test: /\.js$/,
                exclude: (/node_modules/),
                use: {
                    loader: 'babel-loader',
                    options: {
                        "presets": [
                            "es2015-ie"
                        ]
                    }
                }
            }
        ]
    }
};
