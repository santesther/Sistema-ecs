
import { application } from "controllers/application"

import { application } from "../controllers/application"

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"

//import HelloController from "./hello_controller"
//application.register("hello", HelloController)


import { application } from "./application"

import AlertController from "./alert_controller"
application.register("alert", AlertController)

