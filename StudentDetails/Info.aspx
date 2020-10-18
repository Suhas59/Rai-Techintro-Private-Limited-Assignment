<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Info.aspx.cs" Inherits="StudentDetails.Info" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <style>
        .td {
            width: 50%;
        }


        /*custom font*/
        /*@import url(https://fonts.googleapis.com/css?family=Montserrat);*/

        /*basic reset*/
        * {
            margin: 0;
            padding: 0;
        }

        html {
            height: 100%;
            /*Image only BG fallback*/
            /*background = gradient + image pattern combo*/
           /*background: linear-gradient(rgba(196, 102, 0, 0.6), rgba(155, 89, 182, 0.6));*/
           /*background:bisque;*/
        }

        body {
            font-family: montserrat, arial, verdana;
        }
        /*form styles*/
        #msform {
            width: 400px;
            margin: 50px auto;
            text-align: center;
            position: relative;
        }

            #msform fieldset {
                background: white;
                border: 0 none;
                border-radius: 3px;
                box-shadow: 0 0 15px 1px rgba(0, 0, 0, 0.4);
                padding: 20px 30px;
                box-sizing: border-box;
                width: 80%;
                margin: 0 10%;
                /*stacking fieldsets above each other*/
                position: relative;
            }
                /*Hide all except first fieldset*/
                #msform fieldset:not(:first-of-type) {
                    display: none;
                }
            /*inputs*/
            #msform input, #msform textarea {
                padding: 15px;
                border: 1px solid #ccc;
                border-radius: 3px;
                margin-bottom: 10px;
                width: 100%;
                box-sizing: border-box;
                font-family: montserrat;
                color: #2C3E50;
                font-size: 13px;
            }
            /*buttons*/
            #msform .action-button {
                width: 100px;
                background: #27AE60;
                font-weight: bold;
                color: white;
                border: 0 none;
                border-radius: 1px;
                cursor: pointer;
                padding: 10px 5px;
                margin: 10px 5px;
            }

                #msform .action-button:hover, #msform .action-button:focus {
                    box-shadow: 0 0 0 2px white, 0 0 0 3px #27AE60;
                }
        /*headings*/
        .fs-title {
            font-size: 15px;
            text-transform: uppercase;
            color: #2C3E50;
            margin-bottom: 10px;
        }

        .fs-subtitle {
            font-weight: normal;
            font-size: 13px;
            color: #666;
            margin-bottom: 20px;
        }
        /*progressbar*/
        #progressbar {
            margin-bottom: 30px;
            overflow: hidden;
            /*CSS counters to number the steps*/
            counter-reset: step;
        }

            #progressbar li {
                list-style-type: none;
                color: black;
                text-transform: uppercase;
                font-size: 9px;
                width: 33.33%;
                float: left;
                position: relative;
            }

                #progressbar li:before {
                    content: counter(step);
                    counter-increment: step;
                    width: 20px;
                    line-height: 20px;
                    display: block;
                    font-size: 10px;
                    color: #333;
                    background: white;
                    border-radius: 3px;
                    margin: 0 auto 5px auto;
                }
                /*progressbar connectors*/
                #progressbar li:after {
                    content: '';
                    width: 100%;
                    height: 2px;
                    background: white;
                    position: absolute;
                    left: -50%;
                    top: 9px;
                    z-index: -1; /*put it behind the numbers*/
                }

                #progressbar li:first-child:after {
                    /*connector not needed before the first step*/
                    content: none;
                }
                /*marking active/completed steps green*/
                /*The number of the step and the connector before it = green*/
                #progressbar li.active:before, #progressbar li.active:after {
                    background: #27AE60;
                    color: white;
                }

        .textbox {
            background: none;
            border: none;
            outline: none;
            box-shadow: none;
            border-bottom: 2px solid #ddd;
        }

        .btn {
            margin-left: 159px;
        }

        .btnsave {
            color: white;
            background-color: green;
        }

        .btncancel {
            color: white;
            background-color: red;
        }

        .btnupdate {
            color: white;
            background-color: green;
        }
    </style>


    <script type="text/javascript">

        //jQuery time
        var basicinfo2, education2, previous_fs; //fieldsets
        var left, opacity, scale; //fieldset properties which we will animate
        var animating; //flag to prevent quick multi-click glitches

        $(".showform").click(function () {
            alert('test')
            if (animating) return false;
            animating = true;

            basicinfo2 = $(this).parent();
            education2 = $(this).parent().next();

            //activate next step on progressbar using the index of next_fs
            $("#progressbar li").eq($("fieldset").index(education2)).addClass("active");

            //show the next fieldset
            education2.show();
            //hide the current fieldset with style
            basicinfo2.animate({ opacity: 0 }, {
                step: function (now, mx) {
                    //as the opacity of current_fs reduces to 0 - stored in "now"
                    //1. scale current_fs down to 80%
                    scale = 1 - (1 - now) * 0.2;
                    //2. bring next_fs from the right(50%)
                    left = (now * 50) + "%";
                    //3. increase opacity of next_fs to 1 as it moves in
                    opacity = 1 - now;
                    basicinfo2.css({
                        'transform': 'scale(' + scale + ')',
                        'position': 'absolute'
                    });
                    education2.css({ 'left': left, 'opacity': opacity });
                },
                duration: 800,
                complete: function () {
                    basicinfo2.hide();
                    animating = false;
                },
                //this comes from the custom easing plugin
                easing: 'easeInOutBack'
            });
        });

        $(".previous").click(function () {
            if (animating) return false;
            animating = true;

            basicinfo2 = $(this).parent();
            previous_fs = $(this).parent().prev();

            //de-activate current step on progressbar
            $("#progressbar li").eq($("fieldset").index(basicinfo2)).removeClass("active");

            //show the previous fieldset
            previous_fs.show();
            //hide the current fieldset with style
            basicinfo2.animate({ opacity: 0 }, {
                step: function (now, mx) {
                    //as the opacity of current_fs reduces to 0 - stored in "now"
                    //1. scale previous_fs from 80% to 100%
                    scale = 0.8 + (1 - now) * 0.2;
                    //2. take current_fs to the right(50%) - from 0%
                    left = ((1 - now) * 50) + "%";
                    //3. increase opacity of previous_fs to 1 as it moves in
                    opacity = 1 - now;
                    basicinfo2.css({ 'left': left });
                    previous_fs.css({ 'transform': 'scale(' + scale + ')', 'opacity': opacity });
                },
                duration: 800,
                complete: function () {
                    basicinfo2.hide();
                    animating = false;
                },
                //this comes from the custom easing plugin
                easing: 'easeInOutBack'
            });
        });

        $(".submit").click(function () {
            return false;
        })


        //function showform(val) {
        //    if (val == "EducationalInfo") {
        //        //$('#PAYMENT').tab('show');
        //        $('.nav-pills a[href="#EducationalInfo"]').tab('show');
        //    }

        //}




    </script>

    <script type="text/javascript">

        function validation() {
            var txtfirstname = document.getElementById("<%=txtfirstname.ClientID%>")
            var txtlastname = document.getElementById("<%=txtlastname.ClientID%>")
            var txtmidlename = document.getElementById("<%=txtmidlename.ClientID%>")

            if (txtfirstname.value == "") {

                alert("please enter your First Name");
                return false;
            }
            if (txtmidlename.value == "") {

                alert("please enter your First Name");
                return false;
            }
            if (txtlastname.value == "") {

                alert("please enter your First Name");
                return false;
            }

            return true;

        }

        function displayform(val) {
            debugger;
            if (val == 'EDUCATION') {
                var valid = validation();
                if (valid) {
                   // $('#diveducationinfo').show();
                    return true;
                }
               
            }
            if (val == 'OTHER') {
                var valid = true;
                if (valid) {
                    $('#divotherinfo').show();
                    return true;
                }

            }
            return false;

        }

    </script>



</head>

<body>
    <form id="form1" runat="server">
        <asp:HiddenField ID="hidid" runat="server" />
        <div class="col-md-12" style="background:white;">

            <div class="container">

                <ul id="progressbar" style="text-align: center; padding-top: 30px; display: none;">
                    <li class="active">Basic Info</li>
                    <li>Educational Info</li>
                    <li>Other Info</li>
                </ul>

                <div id="divbasicinfo" runat="server">
                    <fieldset id="basicinfo2">
                    <h2 class="fs-title">Basic Info</h2>
                    <div id="basicinfo">
                        <div class="form-group" style="margin-left: 58px;">
                            <div class="row">
                                <div class="col-md-3">
                                    <label>First Name:</label>

                                </div>

                                <div class="col-md-8">

                                    <asp:TextBox ID="txtfirstname" runat="server" CssClass="textbox"></asp:TextBox>
                                </div>


                            </div>
                            <br />
                            <div class="clearfix">
                            </div>


                            <%--<div class="form-group">--%>
                            <div class="row">
                                <div class="col-md-3">
                                    <label>Middle Name:</label>

                                </div>

                                <div class="col-md-8">

                                    <asp:TextBox ID="txtmidlename" runat="server" CssClass="textbox"></asp:TextBox>
                                </div>


                            </div>
                            <br />
                            <%--</div>--%>

                            <%--<div class="form-group">--%>
                            <div class="row">
                                <div class="col-md-3">
                                    <label>Last Name:</label>

                                </div>

                                <div class="col-md-8">

                                    <asp:TextBox ID="txtlastname" runat="server" CssClass="textbox"></asp:TextBox>
                                </div>


                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-3">
                                    <asp:Button ID="btnsavenext" runat="server" Text="Save & Next " OnClientClick="return displayform('EDUCATION')" CssClass="btnsave" OnClick="btnsavenext_Click" />

                                </div>

                                <div class="col-md-8">

                                    <asp:Button ID="btncancel" runat="server" Text="Cancel " CssClass="btncancel" OnClick="btncancel_Click" />

                                    <asp:LinkButton ID="lnkskip" runat="server" CssClass="btn">Skip</asp:LinkButton>
                                </div>


                            </div>
                        </div>
                    </div>
                </fieldset>
                </div>
                
                <div id="diveducationinfo" runat="server" style="display:none">
                <fieldset id="education2">
                    <h2 class="fs-title">Educational Info </h2>
                    <div id="EducationalInfo">
                        <div class="form-group" style="margin-left: 58px;">
                            <div class="row">
                                <div class="col-md-3">
                                    <label>Collage:</label>

                                </div>

                                <div class="col-md-8">

                                    <asp:TextBox ID="txtcollage" runat="server" CssClass="textbox"></asp:TextBox>
                                </div>


                            </div>
                            <br />
                            <div class="clearfix">
                            </div>


                            <%--<div class="form-group">--%>
                            <div class="row">
                                <div class="col-md-3">
                                    <label>Degree:</label>

                                </div>

                                <div class="col-md-8">

                                    <asp:TextBox ID="txtdegree" runat="server" CssClass="textbox"></asp:TextBox>
                                </div>


                            </div>
                            <br />
                            <%--</div>--%>

                            <%--<div class="form-group">--%>
                            <div class="row">
                                <div class="col-md-3">
                                    <label>Specialisation:</label>

                                </div>

                                <div class="col-md-8">

                                    <asp:TextBox ID="txtspecialisation" runat="server" CssClass="textbox"></asp:TextBox>
                                </div>


                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-3">
                                    <label>Date of Passing:</label>

                                </div>

                                <div class="col-md-8">

                                    <asp:TextBox ID="txtdate" runat="server"  CssClass="textbox"></asp:TextBox>
                                </div>


                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-3">
                                    <asp:Button ID="btnupdate" runat="server" Text="Save & Next " CssClass="btnupdate" OnClick="btnupdate_Click" />

                                </div>

                                <div class="col-md-8">

                                    <asp:Button ID="btncancel2" runat="server" Text="Cancel " CssClass="btncancel" OnClick="btncancel2_Click" />

                                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn">Skip</asp:LinkButton>
                                </div>


                            </div>
                        </div>
                    </div>
                    <%--</div>--%>
                </fieldset>
                </div>

                <div id="divotherinfo" runat="server" style="display:none">
                <fieldset id="otherinfo">
                    <h2 class="fs-title">Other Info </h2>
                    <div id="OtherInformation">
                        <div class="form-group" style="margin-left: 58px;">
                            <div class="row">
                                <div class="col-md-3">
                                    <label>Allergies(if any):</label>

                                </div>

                                <div class="col-md-8">

                                    <asp:TextBox ID="txtallergies" runat="server" CssClass="textbox"></asp:TextBox>
                                </div>


                            </div>
                            <br />
                            <div class="clearfix">
                            </div>


                            <%--<div class="form-group">--%>
                            <div class="row">
                                <div class="col-md-3">
                                    <label>Hobbies:</label>

                                </div>

                                <div class="col-md-8">

                                    <asp:TextBox ID="txthobbies" runat="server" CssClass="textbox"></asp:TextBox>
                                </div>


                            </div>
                            <br />
                            <%--</div>--%>

                            <%--<div class="form-group">--%>
                            <div class="row">
                                <div class="col-md-3">
                                    <label>City:</label>

                                </div>

                                <div class="col-md-8">

                                    <asp:TextBox ID="txtcity" runat="server" CssClass="textbox"></asp:TextBox>
                                </div>


                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-3">
                                    <label>Date of Birth:</label>

                                </div>

                                <div class="col-md-8">

                                    <asp:TextBox ID="txtdateofbirth" runat="server" TextMode="Date" CssClass="textbox"></asp:TextBox>
                                </div>


                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-3">
                                    <asp:Button ID="savesubmit" runat="server" Text="Save & Submit " CssClass="btnupdate" OnClick="savesubmit_Click" />

                                </div>

                                <div class="col-md-8">

                                    <asp:Button ID="btncancel5" runat="server" Text="Cancel " CssClass="btncancel" OnClick="btncancel5_Click" />


                                </div>


                            </div>
                        </div>
                    </div>
                    <%--</div>--%>
                </fieldset>
                    </div>
            </div>

        </div>
    </form>
</body>
</html>

