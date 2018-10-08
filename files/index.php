<?php
function adminer_object() {
    // required to run any plugin
    include_once "./plugin.php";

    // enable empty password
    include_once "./login-password-less.php";

    $plugins = array(
        // specify enabled plugins here
        new AdminerLoginPasswordLess(password_hash("root", PASSWORD_DEFAULT)),
    );

    /* It is possible to combine customization and plugins:
    class AdminerCustomization extends AdminerPlugin {
    }
    return new AdminerCustomization($plugins);
    */

    return new AdminerPlugin($plugins);
}

// include original Adminer or Adminer Editor
include "./adminer.php";