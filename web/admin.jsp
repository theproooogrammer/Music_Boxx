<%@page import="com.musicbox.actions.Action"%>
<%
    response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");

    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    }

%>

<%    if (session.getAttribute("username") == null) {
%>
<%@include file="header1.jsp" %>
<%
} else {
%>
<%@include file="header2.jsp" %>
<%            }

%>
<html lang="en">
    <head> 
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>MuSIC BoX</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">   
        <!-- Custom styles for this template -->
        <link href="css/modern-business.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/vendor.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="css/4-col-portfolio.css" rel="stylesheet">
        <link href="css/album.css" rel="stylesheet">
        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="css/modern-business.css" rel="stylesheet">
    </head>
    <body>
        <br>
        <div class="container">
            <div>
                <table class="table">
                    <thead>
                        <tr class="table-primary">
                            <th scope="col"><h3>HELLO ADMIN!</h3></th>
                            <th scope="col">      </th>
                            <th scope="col">      </th>
                            <th scope="col">      </th>
                        </tr> 
                    </thead>
                </table>
                <center>       
                    <table>
                        <tr><td>
                        <center><h2><a  href="addsongUI.jsp"</a>ADD SONG</h2></center>
                        </td></tr>
                    </table>
                </center>
                <br>      
                <table class="table" border="1">
                    <thead>
                        <tr>
                            <th>Song Name</th>
                            <th>Artist</th>
                            <th>Album</th>
                            <th>Genre</th>
                            <th>DELETE</th>
                            <th>UPDATE</th>
                        </tr>
                        <%  ResultSet resultAdmin = null;
                            Action action = new Action();
                            resultAdmin = action.viewAllSongs();

                            while (resultAdmin.next()) {

                        %>
                        <tr>
                            <td>
                                <%=resultAdmin.getString("sname")%>    
                            </td>
                            <td>
                                <%=resultAdmin.getString("sartist")%>    
                            </td>
                            <td>
                                <%=resultAdmin.getString("salbum")%>    
                            </td>
                            <td>
                                <%=resultAdmin.getString("sgenre")%>    
                            </td>
                            <td>
                                <h5><a href="deletesong.jsp?sname=<%=resultAdmin.getString("sname")%>"</a>Delete Song</h5>  
                            </td>
                            <td>
                                <h5><a href="updatesong.jsp?sname=<%=resultAdmin.getString("sname")%>"</a>Update Song</h5>  
                            </td>
                        </tr>
                        <%      }
                        %>
                    </thead>
                </table>

            </div>
        </div>
        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <%resultAdmin.close();%>
    </body>

</html>