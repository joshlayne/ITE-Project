<?php
// Connect to MySQL database
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "islandMovers_fl";

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Query to fetch data
$sql = "SELECT VehicleID, VehicleType, LicensePlate FROM vehicles";
$result = $conn->query($sql);

// Check if query was successful
if ($result->num_rows > 0) {
    // Start dropdown menu
    echo "<select name='vehicle'>";
    
    // Output options
    while($row = $result->fetch_assoc()) {
        echo "<option value='" . $row['VehicleID'] . "'>" . $row['VehicleType'] . " - " . $row['LicensePlate'] . "</option>";
    }
    
    // End dropdown menu
    echo "</select>";
} else {
    echo "No data found";
}

// Close database connection
$conn->close();
?>
