<?php
session_start();
error_reporting(0);
include('includes/config.php');

// Process for Sign
if(isset($_POST['signin'])) {
    // Getting Post Values
    $uname = $_POST['username'];
    $password = md5($_POST['password']);

    // Query for signing matching username and password with db details
    $sql ="SELECT Userid, IsActive FROM tblusers WHERE UserName=:uname AND UserPassword=:password";
    // Preparing the query
    $query = $dbh->prepare($sql);
    // Binding the values
    $query->bindParam(':uname', $uname, PDO::PARAM_STR);
    $query->bindParam(':password', $password, PDO::PARAM_STR);
    // Execute the query
    $query->execute();
    $results = $query->fetchAll(PDO::FETCH_OBJ);

    if($query->rowCount() > 0) {
        foreach ($results as $result) {
            $status = $result->IsActive;
            $_SESSION['usrid'] = $result->Userid;
        }

        if($status == 0) {
            echo "<script>alert('Your account is Inactive. Please contact admin');</script>";
        } else {
            echo "<script type='text/javascript'> document.location = 'profile.php'; </script>";
        }
    } else {
        echo "<script>alert('Invalid Details');</script>";
    }
}
?>

<!doctype html>
<html class="no-js" lang="en">
<head>
    <title>Event Management System | user signin </title>
    <!-- Bootstrap v3.3.6 CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Animate CSS -->
    <link rel="stylesheet" href="css/animate.css">
    <!-- Meanmenu CSS -->
    <link rel="stylesheet" href="css/meanmenu.min.css">
    <!-- Owl.carousel CSS -->
    <link rel="stylesheet" href="css/owl.carousel.css">
    <!-- Icofont CSS -->
    <link rel="stylesheet" href="css/icofont.css">
    <!-- Nivo CSS -->
    <link rel="stylesheet" href="css/nivo-slider.css">
    <!-- Animation text CSS -->
    <link rel="stylesheet" href="css/animate-text.css">
    <!-- Material Iconic Fonts CSS -->
    <link rel="stylesheet" href="css/material-design-iconic-font.min.css">
    <!-- Style CSS -->
    <link rel="stylesheet" href="style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- Color CSS -->
    <link href="css/color/skin-default.css" rel="stylesheet">
    <!-- Modernizr CSS -->
    <script src="js/vendor/modernizr-2.8.3.min.js"></script>
</head>
<body>
    <!-- Body wrapper area start -->
    <div class="wrapper single-blog">
        <!-- Slider header area start -->
        <div id="home" class="header-slider-area">
            <!-- Header start -->
            <?php include_once('includes/header.php');?>
            <!-- Header end -->
        </div>
        <!-- Slider header area end -->

        <!-- Breadcrumb area start -->
        <div class="breadcumb-area bg-overlay">
            <div class="container">
                <ol class="breadcrumb">
                    <li><a href="index.html">Home</a></li>
                    <li class="active">News</li>
                </ol>
            </div>
        </div>
        <!-- Breadcrumb area end -->

        <!-- Main blog area start -->
        <div class="single-blog-area ptb100 fix">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-sm-7">
                        <div class="single-blog-body">
                            <div class="Leave-your-thought mt50">
                                <h3 class="aside-title uppercase">Latest News</h3>
                                <div class="row">
                                    <form name="signin" method="post">
                                        <div class="col-md-12 col-sm-6 col-xs-12 lyt-left">
                                            <table border="2" class="table">
                                                <tr>
                                                    <th>#</th>
                                                    <th>News Title</th>
                                                    <th>News Description</th>
                                                    <th>Posting Date</th>
                                                </tr>
                                                <?php
                                                $sql = "SELECT NewsTitle, NewsDetails, PostingDate FROM tblnews ORDER BY id DESC";
                                                $query = $dbh->prepare($sql);
                                                if ($query->execute()) {
                                                    $results = $query->fetchAll(PDO::FETCH_OBJ);
                                                    error_log("Fetched news data successfully.");
                                                } else {
                                                    error_log("Failed to fetch news data.");
                                                }
                                                $cnt = 1;
                                                if($query->rowCount() > 0) {
                                                    foreach($results as $row) { ?>
                                                        <tr>
                                                            <td><?php echo htmlentities($cnt); ?></td>
                                                            <td><?php echo htmlentities($row->NewsTitle); ?></td>
                                                            <td><?php echo htmlentities($row->NewsDetails); ?></td>
                                                            <td><?php echo htmlentities($row->PostingDate); ?></td>
                                                        </tr>
                                                        <?php $cnt++;
                                                    }
                                                } else {
                                                    echo "<tr><td colspan='4'>No news found</td></tr>";
                                                }
                                                ?>
                                            </table>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Main blog area end -->

        <!-- Footer area start -->
        <?php include_once('includes/footer.php');?>
        <!-- Footer area end -->
    </div>
    <!-- Body wrapper area end -->

    <!-- All JS here -->
    <!-- jQuery latest version -->
    <script src="js/vendor/jquery-3.1.1.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Owl.carousel JS -->
    <script src="js/owl.carousel.min.js"></script>
    <!-- Meanmenu JS -->
    <script src="js/jquery.meanmenu.js"></script>
    <!-- Nivo JS -->
    <script src="js/nivo-slider/jquery.nivo.slider.pack.js"></script>
    <script src="js/nivo-slider/nivo-active.js"></script>
    <!-- Wow JS -->
    <script src="js/wow.min.js"></script>
    <!-- YouTube Background JS -->
    <script src="js/jquery.mb.YTPlayer.min.js"></script>
    <!-- Datepicker JS -->
    <script src="js/bootstrap-datepicker.js"></script>
    <!-- Waypoints JS -->
    <script src="js/waypoints.min.js"></script>
    <!-- Onepage nav JS -->
    <script src="js/jquery.nav.js"></script>
    <!-- Animate text JS -->
    <script src="js/animate-text.js"></script>
    <!-- Plugins JS -->
    <script src="js/plugins.js"></script>
    <!-- Main JS -->
    <script src="js/main.js"></script>
</body>
</html>
