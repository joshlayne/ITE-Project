<?php
session_start();

// Function to connect to the database
function connectToDatabase() {
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "islandMovers_ae";

    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    return $conn;
}

// Function to check if the email exists in the database
function checkEmail($email) {
    $conn = connectToDatabase();

    $sql = "SELECT Email FROM customers WHERE Email = '$email'";
    // $stmt = $conn->prepare($sql);
    // $stmt->bind_param("s", $email);
    // $stmt->execute();
    // $result = $stmt->get_result();
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // Email exists, return true
        // $stmt->close();
        $conn->close();
        return true;
    } else {
        // Email doesn't exist, return false
        // $stmt->close();
        $conn->close();
        return false;
    }
}


function returnID($email) {
    $conn = connectToDatabase();

    $sql = "SELECT * FROM Customers WHERE email = '$email'";
    // $stmt = $conn->prepare($sql);
    // $stmt->bind_param("s", $email);
    // $stmt->execute();
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // ID exists, return true
        $row = $result->fetch_assoc();
        return $row['CustomerID'];
    } else {
        // ID doesn't exist, return false
        return NULL;
    }

    // $stmt->close();
    $conn->close();
}

// Function to create a new record with the ID
function createRecord($fname, $lname, $email, $phone) {
    $conn = connectToDatabase();

    $sql = "INSERT INTO Customers (CountryID, FirstName, LastName, Email, PhoneNumber) VALUES (4, '$fname', '$lname', '$email', '$phone')";
    // $stmt = $conn->prepare($sql);
    // $stmt->bind_param("s", $email);
    // $stmt->execute();
    $conn->query($sql);

    // $stmt->close();
    $conn->close();
}

// Main code starts here
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $conn = connectToDatabase();
    $entered_fname = $_POST["fname"];
    $entered_lname = $_POST["lname"];
    $entered_email = $_POST["email"];
    $entered_phone = $_POST["phone"];


    // Check if ID exists in the database
    if (checkEmail($entered_email)) {
        // ID exists, store it in session variable
        $_SESSION["id"] = returnID($entered_email);
        //echo $_SESSION["id"];
        $id = $_SESSION["id"];

        $sql = "SELECT * FROM rides WHERE UserID = '$id'";
        $result = $conn->query($sql);

        $output = "";

        if ($result->num_rows > 0) {
            // Output data of each row

            while($row = $result->fetch_assoc()) {
                // $output .= $row["RideID"]. " " . $row["UserID"]. " " . $row["VehicleID"]. " " . $row["PickupLocation"]. " " . $row["Destination"]. " " . $row["RideDateTime"]. " " . $row["RideStatus"]. " " . $row["RideCost"]. "<br>";
                // You can display other columns as needed

                $output .= '<tr>';
                $output .= '<td>' . $row["RideID"] . '</td>';
                $output .= '<td>' . $row["UserID"] . '</td>';
                $output .= '<td>' . $row["VehicleID"] . '</td>';
                $output .= '<td>' . $row["PickupLocation"] . '</td>';
                $output .= '<td>' . $row["Destination"] . '</td>';
                $output .= '<td>' . $row["RideDateTime"] . '</td>';
                $output .= '<td>' . $row["RideStatus"] . '</td>';
                $output .= '<td>' . $row["RideCost"] . '</td>';
                $output .= '</tr>';
            }

            $_SESSION["output"] = $output;
            header("Location: ../rides_ae.php");
        } else {
            $output .= "0 results found for the email: " . $entered_email;
            $_SESSION["output"] = $output;
            header("Location: ../rides_ae.php");
        }
        //echo "ID exists!";
    } else {
        // ID doesn't exist, create a new record and store it in session variable
        createRecord($entered_fname, $entered_lname, $entered_email, $entered_phone);
        $_SESSION["id"] = returnID($entered_email);
        $id = $_SESSION["id"];

        $sql = "SELECT * FROM rides WHERE UserID = '$id'";
        $result = $conn->query($sql);

        $output = "";

        if ($result->num_rows >= 0) {
            // Output data of each row

            while($row = $result->fetch_assoc()) {
                // $output .= $row["RideID"]. " " . $row["UserID"]. " " . $row["VehicleID"]. " " . $row["PickupLocation"]. " " . $row["Destination"]. " " . $row["RideDateTime"]. " " . $row["RideStatus"]. " " . $row["RideCost"]. "<br>";
                // You can display other columns as needed

                $output .= '<tr>';
                $output .= '<td>' . $row["RideID"] . '</td>';
                $output .= '<td>' . $row["UserID"] . '</td>';
                $output .= '<td>' . $row["VehicleID"] . '</td>';
                $output .= '<td>' . $row["PickupLocation"] . '</td>';
                $output .= '<td>' . $row["Destination"] . '</td>';
                $output .= '<td>' . $row["RideDateTime"] . '</td>';
                $output .= '<td>' . $row["RideStatus"] . '</td>';
                $output .= '<td>' . $row["RideCost"] . '</td>';
                $output .= '</tr>';
            }

            $_SESSION["output"] = $output;

            header("Location: ../rides_ae.php");
        }
        //echo "New record created!";
    }
}
?>
