<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]>      <html class="no-js"> <!--<![endif]-->
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>islandMovers - Barbados</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../../../stylesheets/styles.css">
    </head>
    <body>
        <!--[if lt IE 7]>
            <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="#">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

        <div class="navbar">
            <a href="index_bb.html" >
                <img src="../../../assets/22.png" alt="islandMovers logo" style="width:209px;height:65px"></img>
            </a>

            <div class="navbar-links">
                <ul>
                    <li><a href="index_bb.html">Home</a></li>
                    <li><a href="rides_bb.php">Rides</a></li>
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
                        echo $_SESSION["output"];
                    } else {
                        echo "No values set";
                    }
                    ?>
                </div>
            </div>

            <div class="book">
                <div class="contact-con">
                    <p style="font-weight:bold;">Contact Info:</p>
                    <button class="open-button" onclick="openForm()">Open Form</button>
                    <div class="contact-form" id="myForm">
                        <form action="customer_check.php" method="post" class="form-container">
                            <label for="fname">First Name</label>
                            <input type="text" name="fname" placeholder="John">
                            <label for="lname">Last Name:</label>
                            <input type="text" name="lname" placeholder="Doe">
                            <label for="phone">Phone #:</label>
                            <input type="text" name="phone" placeholder="(246) ###-####">
                            <label for="email">Email:</label>
                            <input type="text" name="email" placeholder="xxxxxx@xxxx.com">

                            <button type="submit" class="btn">Login</button>
                            <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
                        </form>
                    </div>
                </div>
                <div class="rides-book">
                    <p style="font-weight:bold;">Book a Ride:</p>
                    <form action="rides_book.php" method="post" class="ridesForm">
                        <label for="vehicle">Vehicle:</label>
                        <?php include 'vehicles_load.php'; ?> <br>
                        <label for="pickup">Pickup Location:</label>
                        <input type="text" name="pickup" placeholder=""><br>
                        <label for="destination">Destination:</label>
                        <input type="text" name="destination" placeholder=""><br>
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
                    <div style="width:32%;"><p style="text-align: center;">(246) 000-0000</p> </div>
                    <div style="width:32%;"><p style="text-align: center;">islandmoversbb@gmail.com</p></div>
                    <div style="width:32%;"><p style="text-align: center;"><img src="../../../assets/13.png" alt="Instagram icon" style="width:21px; height:21px"> @islandmoversbb</p></div>
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