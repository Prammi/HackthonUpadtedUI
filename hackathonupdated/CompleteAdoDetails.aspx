<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompleteAdoDetails.aspx.cs" Inherits="hackathonupdated.CompleteAdoDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="/assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="/assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>CODELETE Hackathon
    </title>
    <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    <!-- CSS Files -->
    <link href="/assets/css/material-dashboard.css?v=2.1.2" rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="/assets/demo/demo.css" rel="stylesheet" />
</head>

<body class="">
    <div class="wrapper ">
        <div class="sidebar" data-color="purple" data-background-color="white" data-image="/assets/img/sidebar-1.jpg">
            <!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"

        Tip 2: you can also add an image using data-image tag
    -->
            <div class="logo">
                <a href="http://www.creative-tim.com" class="simple-text logo-normal">CODELETE
                </a>
            </div>
            <div class="sidebar-wrapper">
          <ul class="nav">
                    <li class="nav-item ">
                        <a class="nav-link" href="./Homepage.aspx">
                            <i class="material-icons">dashboard</i>
                            <p>Dashboard</p>
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="./userprofile.aspx">
                            <i class="material-icons">person</i>
                            <p>Personal Details</p>
                        </a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="./CompleteAdoDetails.aspx">
                            <i class="material-icons">cloud</i>
                            <p>ADO Details</p>
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="./Learnings.aspx">
                            <i class="material-icons">book</i>
                            <p>Learnings</p>
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="./PTODetails.aspx">
                         <i class="material-icons">schedule</i>
                            <p>PTO Details</p>
                        </a>
                    </li>
               <li class="nav-item ">
                        <a class="nav-link" href="./Recognition.aspx">
                         <i class="material-icons">schedule</i>
                            <p>Recognition</p>
                        </a>
                    </li>
                 <li class="nav-item ">
                        <a class="nav-link" href="./FileUpload.aspx">
                         <i class="material-icons">attach_file</i>
                            <p>Upload</p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="main-panel">
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
                <div class="container-fluid">
                    <div class="navbar-wrapper">
                        <a class="navbar-brand" href="javascript:;">ADO Details</a>
                    </div>
              
                </div>
            </nav>
            <!-- End Navbar -->
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header card-header-primary">
                                    <h4 class="card-title ">CODE COMMIT DETAILS</h4>
                                    <p class="card-category">Below are the list of changes done by the user.</p>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead class=" text-primary">
                                                <th>AUTHOR
                                                </th>
                                                <th>COMMENT
                                                </th>
                                                <th>DATE
                                                </th>
                                                <th>ADD
                                                </th>
                                                <th>EDIT
                                                </th>
                                                <th>DELETE
                                                </th>
                                            </thead>
                                            <tbody id="tbCommits">
                                             
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                             <div class="card">
                                <div class="card-header card-header-primary">
                                    <h4 class="card-title ">PULL REQUEST DETAILS</h4>
                                    <p class="card-category">Below are the list of pull request created by the user.</p>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead class=" text-primary">
                                                <th>TITLE
                                                </th>
                                                <th>DESCRIPTION
                                                </th>
                                                <th>REPO NAME
                                                </th>
                                                <th>CREATION DATE
                                                </th>
                                                <th>CREATED BY
                                                </th>
                                               
                                            </thead>
                                            <tbody id="tbPullRequests">
                                            
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                         <div class="col-md-12">
                             <div class="card">
                                <div class="card-header card-header-primary">
                                    <h4 class="card-title ">WORK ITEM DETAILS</h4>
                                    <p class="card-category">Below are the list of work items assigned to User.</p>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead class=" text-primary">
                                                <th>WORK ITEM TYPE
                                                </th>
                                                <th>TITLE
                                                </th>
                                                <th> DESCRIPTION
                                                </th>
                                                <th>CREATION DATE
                                                </th>
                                                <th>AREA PATH
                                                </th>
                                               
                                            </thead>
                                            <tbody id="tbWorkItems">
                                            
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="footer">
                <div class="container-fluid">
                    <nav class="float-left">
                        <ul>
                            <li>
                                <a href="https://www.creative-tim.com">CODELETE
                                </a>
                            </li>
                        </ul>
                    </nav>
                    <div class="copyright float-right">
             Demo by Codelete team for FY21 Talent Hackthon
                    </div>
                </div>
            </footer>
        </div>
    </div>
    
    <!--   Core JS Files   -->
    <script src="/assets/js/core/jquery.min.js"></script>
    <script src="/assets/js/core/popper.min.js"></script>
    <script src="/assets/js/core/bootstrap-material-design.min.js"></script>
    <script src="/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
    <!-- Plugin for the momentJs  -->
    <script src="/assets/js/plugins/moment.min.js"></script>
    <!--  Plugin for Sweet Alert -->
    <script src="/assets/js/plugins/sweetalert2.js"></script>
    <!-- Forms Validations Plugin -->
    <script src="/assets/js/plugins/jquery.validate.min.js"></script>
    <!-- Plugin for the Wizard, full documentation here: https://github.com/VinceG/twitter-bootstrap-wizard -->
    <script src="/assets/js/plugins/jquery.bootstrap-wizard.js"></script>
    <!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
    <script src="/assets/js/plugins/bootstrap-selectpicker.js"></script>
    <!--  Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
    <script src="/assets/js/plugins/bootstrap-datetimepicker.min.js"></script>
    <!--  DataTables.net Plugin, full documentation here: https://datatables.net/  -->
    <script src="/assets/js/plugins/jquery.dataTables.min.js"></script>
    <!--	Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  -->
    <script src="/assets/js/plugins/bootstrap-tagsinput.js"></script>
    <!-- Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
    <script src="/assets/js/plugins/jasny-bootstrap.min.js"></script>
    <!--  Full Calendar Plugin, full documentation here: https://github.com/fullcalendar/fullcalendar    -->
    <script src="/assets/js/plugins/fullcalendar.min.js"></script>
    <!-- Vector Map plugin, full documentation here: http://jvectormap.com/documentation/ -->
    <script src="/assets/js/plugins/jquery-jvectormap.js"></script>
    <!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
    <script src="/assets/js/plugins/nouislider.min.js"></script>
    <!-- Include a polyfill for ES6 Promises (optional) for IE11, UC Browser and Android browser support SweetAlert -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
    <!-- Library for adding dinamically elements -->
    <script src="/assets/js/plugins/arrive.min.js"></script>
    <!--  Google Maps Plugin    -->
    <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
    <!-- Chartist JS -->
    <script src="/assets/js/plugins/chartist.min.js"></script>
    <!--  Notifications Plugin    -->
    <script src="/assets/js/plugins/bootstrap-notify.js"></script>
    <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
    <script src="/assets/js/material-dashboard.js?v=2.1.2" type="text/javascript"></script>
    <!-- Material Dashboard DEMO methods, don't include it in your project! -->
    <script src="/assets/demo/demo.js"></script>
    <script>
        $(document).ready(function () {
            $().ready(function () {
                $sidebar = $('.sidebar');

                $sidebar_img_container = $sidebar.find('.sidebar-background');

                $full_page = $('.full-page');

                $sidebar_responsive = $('body > .navbar-collapse');

                window_width = $(window).width();

                fixed_plugin_open = $('.sidebar .sidebar-wrapper .nav li.active a p').html();

                if (window_width > 767 && fixed_plugin_open == 'Dashboard') {
                    if ($('.fixed-plugin .dropdown').hasClass('show-dropdown')) {
                        $('.fixed-plugin .dropdown').addClass('open');
                    }

                }

                $('.fixed-plugin a').click(function (event) {
                    // Alex if we click on switch, stop propagation of the event, so the dropdown will not be hide, otherwise we set the  section active
                    if ($(this).hasClass('switch-trigger')) {
                        if (event.stopPropagation) {
                            event.stopPropagation();
                        } else if (window.event) {
                            window.event.cancelBubble = true;
                        }
                    }
                });

                $('.fixed-plugin .active-color span').click(function () {
                    $full_page_background = $('.full-page-background');

                    $(this).siblings().removeClass('active');
                    $(this).addClass('active');

                    var new_color = $(this).data('color');

                    if ($sidebar.length != 0) {
                        $sidebar.attr('data-color', new_color);
                    }

                    if ($full_page.length != 0) {
                        $full_page.attr('filter-color', new_color);
                    }

                    if ($sidebar_responsive.length != 0) {
                        $sidebar_responsive.attr('data-color', new_color);
                    }
                });

                $('.fixed-plugin .background-color .badge').click(function () {
                    $(this).siblings().removeClass('active');
                    $(this).addClass('active');

                    var new_color = $(this).data('background-color');

                    if ($sidebar.length != 0) {
                        $sidebar.attr('data-background-color', new_color);
                    }
                });

                $('.fixed-plugin .img-holder').click(function () {
                    $full_page_background = $('.full-page-background');

                    $(this).parent('li').siblings().removeClass('active');
                    $(this).parent('li').addClass('active');


                    var new_image = $(this).find("img").attr('src');

                    if ($sidebar_img_container.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
                        $sidebar_img_container.fadeOut('fast', function () {
                            $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
                            $sidebar_img_container.fadeIn('fast');
                        });
                    }

                    if ($full_page_background.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
                        var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

                        $full_page_background.fadeOut('fast', function () {
                            $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
                            $full_page_background.fadeIn('fast');
                        });
                    }

                    if ($('.switch-sidebar-image input:checked').length == 0) {
                        var new_image = $('.fixed-plugin li.active .img-holder').find("img").attr('src');
                        var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

                        $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
                        $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
                    }

                    if ($sidebar_responsive.length != 0) {
                        $sidebar_responsive.css('background-image', 'url("' + new_image + '")');
                    }
                });

                $('.switch-sidebar-image input').change(function () {
                    $full_page_background = $('.full-page-background');

                    $input = $(this);

                    if ($input.is(':checked')) {
                        if ($sidebar_img_container.length != 0) {
                            $sidebar_img_container.fadeIn('fast');
                            $sidebar.attr('data-image', '#');
                        }

                        if ($full_page_background.length != 0) {
                            $full_page_background.fadeIn('fast');
                            $full_page.attr('data-image', '#');
                        }

                        background_image = true;
                    } else {
                        if ($sidebar_img_container.length != 0) {
                            $sidebar.removeAttr('data-image');
                            $sidebar_img_container.fadeOut('fast');
                        }

                        if ($full_page_background.length != 0) {
                            $full_page.removeAttr('data-image', '#');
                            $full_page_background.fadeOut('fast');
                        }

                        background_image = false;
                    }
                });

                $('.switch-sidebar-mini input').change(function () {
                    $body = $('body');

                    $input = $(this);

                    if (md.misc.sidebar_mini_active == true) {
                        $('body').removeClass('sidebar-mini');
                        md.misc.sidebar_mini_active = false;

                        $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar();

                    } else {

                        $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar('destroy');

                        setTimeout(function () {
                            $('body').addClass('sidebar-mini');

                            md.misc.sidebar_mini_active = true;
                        }, 300);
                    }

                    // we simulate the window Resize so the charts will get updated in realtime.
                    var simulateWindowResize = setInterval(function () {
                        window.dispatchEvent(new Event('resize'));
                    }, 180);

                    // we stop the simulation of Window Resize after the animations are completed
                    setTimeout(function () {
                        clearInterval(simulateWindowResize);
                    }, 1000);

                });
            });
            getAzureDetails();
        });

        function getAzureDetails() {
            BindCommitDetails();
            BindPullRequestDetails();
            BindWorkItemDetails();
        }

        function BindCommitDetails() {
            $.ajax({
                type: "GET",
                url: '<%=ResolveUrl("~/CompleteAdoDetails.aspx/GetCommits") %>',
                data: {},
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function () {

                },
                success: function (response) {
                    var cbody = "";
                    if (response.d.length > 0) {
                        var data = response.d;
                        for (var i = 0; i < response.d.length; i++) {
                            cbody = cbody + '<tr>' +
                                '<td>' + data[i].author + ' </td>' +
                                '<td>' + data[i].comment + ' </td>' +
                                '<td>' + data[i].date + ' </td>' +
                                '<td>' + data[i].add + ' </td>' +
                                '<td>' + data[i].edit + ' </td>' +
                                '<td>' + data[i].delete + ' </td>' +
                                ' </tr>';
                        }
                        $("#tbCommits").html(cbody);
                    }

                },
                complete: function () {
                    // Hide(); // Hide loader icon  
                },
                failure: function (jqXHR, textStatus, errorThrown) {
                    alert("HTTP Status: " + jqXHR.status + "; Error Text: " + jqXHR.responseText); // Display error message  
                }
            });

        }

        function BindPullRequestDetails() {
            $.ajax({
                type: "GET",
                url: '<%=ResolveUrl("~/CompleteAdoDetails.aspx/GetPullRequests") %>',
                data: {},
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function () {

                },
                success: function (response) {
                    var cbody = "";
                    if (response.d.length > 0) {
                        var data = response.d;
                        for (var i = 0; i < response.d.length; i++) {
                            cbody = cbody + '<tr>' +
                                '<td>' + data[i].title + ' </td>' +
                                '<td>' + data[i].description + ' </td>' +
                                '<td>' + data[i].reponame + ' </td>' +
                                '<td>' + data[i].creationDate + ' </td>' +
                                '<td>' + data[i].createdBy + ' </td>' +
                                ' </tr>';
                        }
                        $("#tbPullRequests").html(cbody);
                    }

                },
                complete: function () {
                    // Hide(); // Hide loader icon  
                },
                failure: function (jqXHR, textStatus, errorThrown) {
                    alert("HTTP Status: " + jqXHR.status + "; Error Text: " + jqXHR.responseText); // Display error message  
                }
            });

        }

        function BindWorkItemDetails() {
            $.ajax({
                type: "GET",
                url: '<%=ResolveUrl("~/CompleteAdoDetails.aspx/GetWorkItems") %>',
                data: {},
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function () {

                },
                success: function (response) {
                    var cbody = "";
                    if (response.d.length > 0) {
                        var data = response.d;
                        for (var i = 0; i < response.d.length; i++) {
                            cbody = cbody + '<tr>' +
                                '<td>' + data[i].WorkItemType + ' </td>' +
                                '<td>' + data[i].Title + ' </td>' +
                                '<td>' + data[i].Description + ' </td>' +
                                '<td>' + data[i].CreatedDate + ' </td>' +
                                '<td>' + data[i].AreaPath + ' </td>' +
                                ' </tr>';
                        }
                        $("#tbWorkItems").html(cbody);
                    }

                },
                complete: function () {
                    // Hide(); // Hide loader icon  
                },
                failure: function (jqXHR, textStatus, errorThrown) {
                    alert("HTTP Status: " + jqXHR.status + "; Error Text: " + jqXHR.responseText); // Display error message  
                }
            });

        }
    </script>
</body>
</html>
