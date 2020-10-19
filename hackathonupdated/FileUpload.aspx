﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FileUpload.aspx.cs" Inherits="hackathonupdated.FileUpload" %>

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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
                    <li class="nav-item">
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
                    <li class="nav-item ">
                        <a class="nav-link" href="./CompleteAdoDetails.aspx">
                            <i class="material-icons">cloud</i>
                            <p>ADO Details</p>
                        </a>
                    </li>
                    <li class="nav-item">
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
                          <li class="nav-item active">
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
                        <a class="navbar-brand" href="javascript:;">Uploads</a>
                    </div>
                   
                </div>
            </nav>
            <!-- End Navbar -->
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header card-header-success">
                                    <h4 class="card-title ">Upload Recognition Mailer </h4>
                                    <p class="card-category">Mail content is analysed and stored for futrure reference.</p>
                                </div>
                                <div class="card-body">

                                    <form id="form1" runat="server">
                                        <asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="true" />
                                        <br />
                                        <br />
                                        <asp:Button ID="Button1" runat="server" Text="Upload Selected File(s)" />
                                    </form>

                                </div>
                                <hr/>
                                <div class="spinner-border text-success" style="margin-top: 1%; margin-left: 45%" id="cspinner">

                                </div>
                                <h3 class="tblAnalysedData"  hidden="true" style="margin-left :30px;"> Analysed Output</h3>
                                
                                   <div class="table-success tblAnalysedData" hidden="true" >
                                        <table class="table">
                                            <thead class=" text-success">
                                                <tr>
                                                    <td><b>Slno</b></td>
                                                    <td><b>Body</b></td>
                                                    <td><b>Key Phrases</b></td>
                                                    <td><b>Project</b></td>
                                                     <td><b>Nominated by</b></td>
                                                    <td><b>People to be Tagged</b></td>
                                                      <td><b>Year</b></td>
                                                </tr>
                                            </thead>
                                            <tbody id="tbRecognition">
                                                
                                            </tbody>
                                        </table>
                                    </div>
                            </div>
                            <label class="tblAnalysedData"  hidden="true" id="lblGotoRecognition"> GOTO list of Uploads</label>
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
        });



    </script>
    <script>

        $(document).ready(function () {
            Hide();
            $("#lblGotoRecognition").click(function () {
                window.location.href = "./Recognition.aspx";
            });
            $("#Button1").click(function (evt) {
                
                var fileUpload = $("#FileUpload1").get(0);
                var files = fileUpload.files;
                var filenames = new Array();
                var data = new FormData();
                for (var i = 0; i < files.length; i++) {
                    filenames[i] = files[i].name;
                    data.append(files[i].name, files[i]);
                }

                var options = {};
                options.url = "FileUploadHandler.ashx";
                options.type = "POST";
                options.data = data;
                options.contentType = false;
                options.processData = false;
                options.success = function (result) {
                    analyseMails(filenames);
                };
                options.error = function (err) { alert(err.statusText); };

                $.ajax(options);

                evt.preventDefault();
            });

            function Show() {
                debugger;
                $("#cspinner").show();

                            }

            function Hide() {
                $("#cspinner").hide();

            }
           

            function analyseMails(filenames) {
               
                $.ajax({
                    type: "GET",
                    url: '<%=ResolveUrl("~/FileUpload.aspx/Upload") %>',
                   // data: JSON.stringify({filenames: filenames }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    beforeSend: function () {
                        Show();
                    },
                    success: function (response) {
                        debugger;
                        var fbody = "";
                        if (response.d.length > 0) {
                            var data = response.d;
                            for (var i = 0; i < response.d.length; i++) {
                                lbody =  '<tr>' +
                                    '<td>' + i + 1 + ' </td>' +
                                    "<td style='width: 750px'>" + data[i].Content + ' </td>' +
                                    '<td><b>' + data[i].KeyPhrases + '</b></td>' +
                                    '<td><b>' + data[i].Project + ' </b></td>' +
                                    '<td>' + data[i].Nominatedby + ' </td>' +
                                    '<td>' + data[i].TaggingList + ' </td>' +
                                    '<td>' + data[i].Year + ' </td>' +
                                    ' </tr>';
                                fbody = fbody + lbody;
                            }
                            $("#tbRecognition").html(fbody);
                        }
                    },
                    complete: function () {
                        Hide();
                        $(".tblAnalysedData").removeAttr('hidden');
                     
                    },
                    failure: function (jqXHR, textStatus, errorThrown) {
                        alert("HTTP Status: " + jqXHR.status + "; Error Text: " + jqXHR.responseText); // Display error message  
                    }
                });
            }
            
        });

    </script>
</body>
</html>
