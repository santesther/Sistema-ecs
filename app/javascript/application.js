// Import Turbo and Hotwired controllers
import "@hotwired/turbo-rails"
import "controllers"
import Swal from 'sweetalert2';
window.Swal = Swal;

import { application } from "./application"

import AlertController from "./alert_controller"
application.register("alert", AlertController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

