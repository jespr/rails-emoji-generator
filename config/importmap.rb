# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "turbo_power", to: "https://ga.jspm.io/npm:turbo_power@0.4.0/dist/turbo_power.js"
