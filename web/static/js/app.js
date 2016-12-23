// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

import Elm from './elm/app.js'

const main = document.querySelector('main')
main.innerHTML = ''
const elmApp = Elm.App.embed(main)
