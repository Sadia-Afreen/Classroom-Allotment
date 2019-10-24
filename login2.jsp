<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String username = request.getParameter("user");
            String password = request.getParameter("pass");

            if (username.equals("AY") && password.equals("oodp")) {

        %><h2 align="center" style="color: green">Congratulations! <br> You have successfully logged in. </h2>
        <br><br><br>
        <h3> <a href="one.jsp"> Next</a></h3>
        <%                } else if (username.equals("MK") && password.equals("dm")) {
        %><h2 align="center" style="color: green">Congratulations! <br> You have successfully logged in. </h2>
        <br><br><br>
        <h3> <a href="one.jsp"> Next</a></h3>
        <%
        } else {
        %><h2 align="center" style="color: red">Wrong credentials!</h2>
        <a href="login.html"> Please try again</a>
        <%
            }
        %>
        
        
        <%
        try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?autoReconnect=true&useSSL=false", "root", "root");
                Statement stmt = con.createStatement();
                ResultSet rs;
                String sql, name, clsrm, prd;
                sql = "DROP DATABASE ClsrmAltmntSQL";
                stmt.executeUpdate(sql);
                sql = "CREATE DATABASE ClsrmAltmntSQL";
                stmt.executeUpdate(sql);
                sql = "use ClsrmAltmntSQL";
                stmt.executeUpdate(sql);
                sql = "CREATE TABLE Courses " + "(CourseID INTEGER, "
                        + " CourseName VARCHAR(255), "
                        + " PRIMARY KEY (CourseID))";
                stmt.executeUpdate(sql);
                sql = "INSERT INTO Courses "
                        + "VALUES (2101, 'OODP-II')";
                stmt.executeUpdate(sql);
                sql = "INSERT INTO Courses "
                        + "VALUES (2102, 'OODP-II Lab')";
                stmt.executeUpdate(sql);
                sql = "INSERT INTO Courses "
                        + "VALUES (2103, 'Discrete Mathematics')";
                stmt.executeUpdate(sql);

                sql = "CREATE TABLE Allocate " + "(ClassRoom VARCHAR(255), "
                        + "1stPeriod VARCHAR(255), "
                        + "2ndPeriod VARCHAR(255), "
                        + "3rdPeriod VARCHAR(255), "
                        + "4thPeriod VARCHAR(255), "
                        + "5thPeriod VARCHAR(255), "
                        + "PRIMARY KEY (ClassRoom))";
                stmt.executeUpdate(sql);

                sql = "INSERT INTO Allocate "
                        + "VALUES ('ClassRoom', '1stPeriod', '2ndPeriod', '3rdPeriod', '4thPeriod', '5thPeriod')";
                stmt.executeUpdate(sql);
                sql = "INSERT INTO Allocate "
                        + "VALUES ('CR-601', 'X', 'X', 'X', 'X', 'X')";
                stmt.executeUpdate(sql);
                sql = "INSERT INTO Allocate "
                        + "VALUES ('CR-602', 'X', 'X', 'X', 'X', 'X')";
                stmt.executeUpdate(sql);
                sql = "INSERT INTO Allocate "
                        + "VALUES ('CR-603', 'X', 'X', 'X', 'X', 'X')";
                stmt.executeUpdate(sql);
                sql = "INSERT INTO Allocate "
                        + "VALUES ('ComLAB-1', 'X', 'X', 'X', 'X', 'X')";
                stmt.executeUpdate(sql);
                sql = "INSERT INTO Allocate "
                        + "VALUES ('ComLAB-2', 'X', 'X', 'X', 'X', 'X')";
                stmt.executeUpdate(sql);
                sql = "INSERT INTO Allocate "
                        + "VALUES ('ComLAB-3', 'X', 'X', 'X', 'X', 'X')";
                stmt.executeUpdate(sql);
                

                sql = "CREATE TABLE class_info " + "(classrooms VARCHAR(255), "
                    + "capability VARCHAR(255), "
                    + "computer VARCHAR(255), "
                    + "airconditioning VARCHAR(255), "
                    + "soundsystem VARCHAR(255), "
                    + "projector VARCHAR(255))";
            stmt.executeUpdate(sql);
            sql = "INSERT INTO class_info "
                    + "VALUES ('classrooms', 'capability', 'computer', 'airconditioning', 'soundsystem', 'projector')";
            stmt.executeUpdate(sql);
            sql = "INSERT INTO class_info "
                    + "VALUES ('CR-601', '50', 'NONE', 'YES', 'YES', 'YES')";
            stmt.executeUpdate(sql);
            sql = "INSERT INTO class_info "
                    + "VALUES ('CR-602', '40', 'NONE', 'YES', 'YES', 'YES')";
            stmt.executeUpdate(sql);
            sql = "INSERT INTO class_info "
                    + "VALUES ('CR-603', '45', 'NONE', 'YES', 'YES', 'YES')";
            stmt.executeUpdate(sql);
            sql = "INSERT INTO class_info "
                    + "VALUES ('CLAB-1', '50', '50', 'NO', 'NO', 'YES')";
            stmt.executeUpdate(sql);
            sql = "INSERT INTO class_info "
                    + "VALUES ('CLAB-2', '50', '48', 'YES', 'YES', 'YES')";
            stmt.executeUpdate(sql);
            sql = "INSERT INTO class_info "
                    + "VALUES ('CLAB-3', '50', '40', 'YES', 'YES', 'YES')";
            stmt.executeUpdate(sql);
            
            } catch (Exception e) {
                out.print(e);
            }
               


        %>
    </body>
</html>
