<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]>      <html class="no-js"> <!--<![endif]-->
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>islandMovers - Florida</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../../../stylesheets/styles.css">
    </head>
    <body>
        <!--[if lt IE 7]>
            <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="#">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

        <div class="navbar">
            <a href="index_fl.html" >
                <img src="../../../assets/logo.png" alt="islandMovers logo" style="width:209px;height:65px" id="logo"></img>
            </a>

            <div class="navbar-links">
                <ul>
                    <li><a href="index_fl.html">Home</a></li>
                    <li><a href="rides_fl.php">Rides</a></li>
                </ul>
            </div>
        </div>

        <div class="container-2">
            <div class="rides">
                <p class="heading">Rides History</p>
                <div class="table-con">
                <?php
                    session_start();
                    if(isset($_SESSION["output"])) {
                        echo "<table>" . "
                        <tr>
                            <th>Ride ID</th>
                            <th>User ID</th>
                            <th>Vehicle ID</th>
                            <th>Pick-up Location</th>
                            <th>Destination</th>
                            <th>Date & Time</th>
                            <th>Status</th>
                            <th>Price</th>
                        </tr>" . $_SESSION["output"] . "</table>";
                    } else {
                        echo "Enter your contact info in the form provided to the right to see rides history.";
                    }
                    ?>
                </div>
            </div>

            <div class="book">
                <div class="contact-con">
                    <p style="font-weight:bold;">Contact Info:</p>
                    <button class="open-button" onclick="openForm()">Open Form</button>
                    <div class="contact-form" id="myForm">
                        <form action="./php/customer_check.php" method="post" class="form-container">
                            <label for="fname">First Name</label>
                            <input type="text" name="fname" id="fname" placeholder="John" required>
                            <label for="lname">Last Name:</label>
                            <input type="text" name="lname" id="lname" placeholder="Doe" required>
                            <label for="phone">Phone #:</label>
                            <input type="text" name="phone" id="phone" placeholder="(305) ###-####" required>
                            <label for="email">Email:</label>
                            <input type="text" name="email" id="email" placeholder="xxxxxx@xxxx.com" required>

                            <button type="submit" class="btn">Login</button>
                            <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
                        </form>
                    </div>
                </div>
                <div class="rides-book">
                    <p style="font-weight:bold;">Book a Ride:</p>
                    <form action="./php/rides_book.php" method="post" class="ridesForm">
                        <label for="vehicle">Vehicle:</label>
                        <?php include './php/vehicles_load.php'; ?> <br>
                        <label for="pickup">Pickup Location:</label>
                        <input type="text" name="pickup" id="pickup" placeholder="" required><br>
                        <label for="destination">Destination:</label>
                        <input type="text" name="destination" id="destination" placeholder="" required><br>
                        <!-- <label for="time">Time:</label>
                        <input type="text" name="time" placeholder="00:00"><br> -->

                        <button type="submit" class="btn">Book</button>
                    </form>
                </div>
            </div>
        </div>

        <div class="footer-2">
            <div class="contact-box2" style="clear: both; width:100%; ">
                <p class="heading">Contact us</p>
                <div class="info" style="display:flex;">
                    <div style="width:32%;"><p style="text-align: center;">(305) 000-0000</p> </div>
                    <div style="width:32%;"><p style="text-align: center;">islandmoversfl@gmail.com</p></div>
                    <div style="width:32%;"><p style="text-align: center;"><img src="../../../assets/13.png" alt="Instagram icon" style="width:21px; height:21px"> @islandmoversfl</p></div>
                </div>
            </div>
        </div>
        <script src="" async defer></script>
        <script>
            function openForm() {
                document.getElementById("myForm").style.display = "block";
            }

            function closeForm() {
                document.getElementById("myForm").style.display = "none";
            }
        </script>
    </body>
</html>