<?php
	$servername = "localhost";
	$username = "root";
	$password = "";

	try {
  		$conn = new PDO("mysql:host=$servername;dbname=issam", $username, $password);
  		// set the PDO error mode to exception
  		$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  		echo "Connected successfully\n";
	} catch(PDOException $e) {
  		echo "Connection failed: " . $e->getMessage() . "\n";
	}	
?>
