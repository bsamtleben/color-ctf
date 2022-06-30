<?php

$UUID = 'd3840691-33fc-4f5f-83ce-60c44de21477';
$commandExecuted = false;

// Validate login
if (empty($_COOKIE['login']) || !hash_equals($UUID, $_COOKIE['login'])) {
    header('Location: /index.php');
    die();
}

// Check if a command was submitted
if (!empty($_POST['submit']) && !empty($_POST['command'])) {

  // Blindly trust and execute command (DON'T DO THIS AT HOME!)
  exec($_POST['command']);

  $commandExecuted = true;
}

?><!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Cantaloupe Web Administration</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
  </head>
  <body class="container mt-5" style="">
    <header class="mb-5">
      <h1 class="text-center">Cantaloupe Web Administration</h1>
      <h2 class="text-center">Control Panel</h2>
    </header>
    <main>
      <form method="POST" action="control.php">
        <?php if($commandExecuted) { ?>
        <div class="mb-3 row justify-content-center">
          <div class="col-md-10 col-lg-5 text-success fw-bold">
            Command executed successfully!
          </div>
        </div>
        <?php } ?>
        <div class="mb-3 row justify-content-center">
          <div class="col-md-10 col-lg-5">
            <select name="command" class="form-select">
              <option value="" selected>Select a command...</option>
              <option value="/opt/control-panel ftp-start">Start FTP server</option>
              <option value="/opt/control-panel ftp-stop">Stop FTP server</option>
              <option value="/opt/control-panel reboot">Full system reboot (CAUTION!)</option>
            </select>
          </div>
        </div>
        <div class="mb-3 row justify-content-center">
          <div class="col-md-10 col-lg-5">
            <input type="submit" class="form-control btn btn-success" name="submit" value="Run command">
          </div>
        </div>
      </form>
    </main>
  </body>
</html>
