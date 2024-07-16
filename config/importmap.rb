# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"


pin "sweetalert2", to: "https://ga.jspm.io/npm:sweetalert2@11.10.4/dist/sweetalert2.all.js"
pin "jquery", to: "https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.js"

