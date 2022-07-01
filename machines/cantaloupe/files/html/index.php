<?php

$UUID = 'd3840691-33fc-4f5f-83ce-60c44de21477';
$loginAttempt = false;

if (!empty($_POST['username']) && !empty($_POST['password'])) {

    // Store login attempt to display error message in HTML below
    $loginAttempt = true;

    // Validate username and password - use hash_equals to prevent (theoretical) timing attacks
    if (hash_equals('cantaloupe', $_POST['username']) &&
        hash_equals('Zmf4SguWzkwDVju3acdETxksjqW3D7', $_POST['password'])) {

        // Login successful
        setcookie ('login', $UUID);
        header('Location: /control.php');
        die();
    }
}

?><!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Cantaloupe Web Administration</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
  </head>
  <body class="container mt-5" style="">
    <header class="mb-5">
      <h1 class="text-center">Cantaloupe Web Administration</h1>
      <h2 class="text-center">Login</h2>
    </header>
    <main>
      <form method="POST" action="index.php">
        <?php if($loginAttempt) { ?>
        <div class="mb-3 row justify-content-center">
          <div class="col-md-10 col-lg-5 text-danger fw-bold">
            Login failed. The provided credentials were wrong.
          </div>
        </div>
        <?php } ?>
        <div class="mb-3 row justify-content-center">
          <div class="col-md-10 col-lg-5">
            <input type="text" class="form-control" name="username" placeholder="Username">
          </div>
        </div>
        <div class="mb-3 row justify-content-center">
          <div class="col-md-10 col-lg-5">
            <input type="password" class="form-control" name="password" placeholder="Password">
          </div>
        </div>
        <div class="mb-3 row justify-content-center">
          <div class="col-md-10 col-lg-5">
            <input type="submit" class="form-control btn btn-primary" name="submit" value="Login">
          </div>
        </div>
      </form>
    </main>
  </body>
</html>
