import "@hotwired/turbo-rails"
import "controllers"
import Swal from 'sweetalert2';
window.Swal = Swal;

import { Turbo } from "@hotwired/turbo-rails"
Turbo.session.drive = false