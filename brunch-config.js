exports.config = {
  files: {
    javascripts: {
      joinTo: 'js/app.js'
    },
    stylesheets: {
      joinTo: 'css/app.css',
      order: {
        after: ['web/static/css/app.css'] // concat app.css last
      }
    },
    templates: {
      joinTo: 'js/app.js'
    }
  },

  conventions: {
    assets: /^(web\/static\/assets)/
  },

  paths: {
    watched: [
      'web/elm',
      'web/static',
      'test/static'
    ],

    public: 'priv/static'
  },

  // Configure your plugins
  plugins: {
    babel: {
      ignore: [/web\/static\/vendor/]
    },
    elmBrunch: {
      elmFolder: 'web/elm',
      mainModules: ['App.elm'],
      outputFolder: '../static/vendor'
    }
  },

  modules: {
    autoRequire: {
      'js/app.js': [
        'web/static/vendor/app',
        'web/static/js/app'
      ]
    }
  },

  npm: {
    enabled: true
  }
}
