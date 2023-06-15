# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "https://ga.jspm.io/npm:@hotwired/stimulus@3.2.1/dist/stimulus.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true
pin "mapbox-gl", to: "https://ga.jspm.io/npm:mapbox-gl@2.15.0/dist/mapbox-gl.js"
pin "process", to: "https://ga.jspm.io/npm:@jspm/core@2.0.1/nodelibs/browser/process-production.js"
pin "stimulus-scroll-progress", to: "https://ga.jspm.io/npm:stimulus-scroll-progress@4.1.0/dist/stimulus-scroll-progress.mjs"
pin "lodash", to: "https://ga.jspm.io/npm:lodash@4.17.21/lodash.js"
pin "typed.js", to: "https://ga.jspm.io/npm:typed.js@2.0.16/dist/typed.module.js"
