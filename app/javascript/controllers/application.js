import { Application } from "@hotwired/stimulus"
import FlashController from "./controllers/flash_controller";

const application = Application.start()
application.register("flash", FlashController);

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
