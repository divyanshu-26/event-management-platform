<?php
session_start();
error_reporting(0);
include('includes/config.php');

$searchQuery = $_GET['query'];

?>

<!doctype html>
<html class="no-js" lang="en">
<head>
    <title>Event Management System | Search Results</title>
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
            <header class="top-area">
                <div class="header-area">
                    <!-- Start Navigation -->
                    <nav class="navbar navbar-default bootsnav navbar-fixed dark no-background">
                        <div class="container">
                            <!-- Start Atribute Navigation -->
                            <div class="attr-nav">
                                <ul>
                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                    <li class="side-menu"><a href="#"><i class="fa fa-bars"></i></a></li>
                                </ul>
                            </div>
                            <!-- End Atribute Navigation -->

                            <!-- Start Header Navigation -->
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
                                    <i class="fa fa-bars"></i>
                                </button>
                                <a class="navbar-brand" href="index.php">Event Management</a>
                            </div>
                            <!-- End Header Navigation -->

                            <!-- Collect the nav links, forms, and other content for toggling -->
                            <div class="collapse navbar-collapse menu-ui-design" id="navbar-menu">
                                <ul class="nav navbar-nav navbar-center" data-in="fadeInDown" data-out="fadeOutUp">
                                    <li><a href="index.php">Home</a></li>
                                    <li><a href="about.php">About</a></li>
                                    <li><a href="events.php">Events</a></li>
                                    <li><a href="news.php">News</a></li>
                                    <li><a href="contact.php">Contact</a></li>
                                </ul>
                            </div><!-- /.navbar-collapse -->
                        </div>
                    </nav>
                    <!-- End Navigation -->
                </div>

                <!-- Search form start -->
                <div class="search-form-container">
                    <form method="get" action="search_results.php" class="search-form">
                        <input type="text" name="query" placeholder="Search news..." required>
                        <button type="submit">Search</button>
                    </form>
                </div>
                <!-- Search form end -->
            </header>
            <!-- Header end -->
        </div>
        <!-- Slider header area end -->

        <!-- Breadcrumb area start -->
        <div class="breadcumb-area bg-overlay">
            <div class="container">
                <ol class="breadcrumb">
                    <li><a href="index.php">Home</a></li>
                    <li class="active">Search Results</li>
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
                                <h3 class="aside-title uppercase">Search Results for "<?php echo htmlentities($searchQuery); ?>"</h3>
                                <div class="row">
                                    <div class="col-md-12 col-sm-6 col-xs-12 lyt-left">
                                        <table border="2" class="table">
                                            <tr>
                                                <th>#</th>
                                                <th>News Title</th>
                                                <th>News Description</th>
                                                <th>Posting Date</th>
                                            </tr>
                                            <?php
                                            $sql = "SELECT NewsTitle, NewsDetails, PostingDate FROM tblnews WHERE NewsTitle LIKE :searchQuery OR NewsDetails LIKE :searchQuery ORDER BY id DESC";
                                            $query = $dbh->prepare($sql);
                                            $searchParam = "%" . $searchQuery . "%";
                                            $query->bindParam(':searchQuery', $searchParam, PDO::PARAM_STR);
                                            if ($query->execute()) {
                                                $results = $query->fetchAll(PDO::FETCH_OBJ);
                                                error_log("Fetched search results successfully.");
                                            } else {
                                                error_log("Failed to fetch search results.");
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
                                                echo "<tr><td colspan='4'>No matching results found</td></tr>";
                                            }
                                            ?>
                                        </table>
                                    </div>
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
