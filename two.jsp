<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor="LightGray">
        <style>
            table
            {
                width: 50%;
            }

        </style>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?autoReconnect=true&useSSL=false", "root", "root");
                Statement stmt = con.createStatement();
                ResultSet rs;
                String sql;
                sql = "use ClsrmAltmntSQL";
                stmt.executeUpdate(sql);
                sql = "SELECT * FROM Allocate";
                rs = stmt.executeQuery(sql);
        %>
        <h2>Available classrooms: </h2>
        <table border=1 align=center style="text-align: center"> 

            <%                while (rs.next()) {
            %>

            <tr>                
                <td><% out.print(rs.getString(1)); %></td>
                <td><% out.print(rs.getString(2)); %></td>
                <td><% out.print(rs.getString(3)); %></td>
                <td><% out.print(rs.getString(4)); %></td>
                <td><% out.print(rs.getString(5)); %></td>
                <td><% out.print(rs.getString(6)); %></td>     

            </tr>

            <%
                }
            %>
        </table>
        <%
            
        %>
        <br>
        <h2>Classrooms Information: </h2>
        <table border=1 align=center style="text-align: center"> 

            <%
                sql = "use ClsrmAltmntSQL";
                stmt.executeUpdate(sql);
                sql = "SELECT * FROM class_info";
                rs = stmt.executeQuery(sql);
                while (rs.next()) {
            %>

            <tr>
                <td><% out.print(rs.getString(1)); %></td>
                <td><% out.print(rs.getString(2)); %></td>
                <td><% out.print(rs.getString(3)); %></td>
                <td><% out.print(rs.getString(4)); %></td>
                <td><% out.print(rs.getString(5)); %></td>
                <td><% out.print(rs.getString(6)); %></td>  

            </tr>

            <%
                }
            %>
        </table>
        <%
            } catch (Exception e) {
                out.print(e);
            }
        %>       
        <br><br>
        <h2><a href="one.jsp">return</a></h2>


    </body>
</html>
