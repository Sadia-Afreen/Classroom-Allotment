<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor="LightGray">

        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?autoReconnect=true&useSSL=false", "root", "root");
                Statement stmt = con.createStatement();
                String sql, name, clsrm, prd;
                sql = "use ClsrmAltmntSQL";
                stmt.executeUpdate(sql);
                ResultSet rs;
                clsrm = request.getParameter("cr");
                prd = request.getParameter("pr");

                sql = "SELECT * FROM Allocate";
                rs = stmt.executeQuery(sql);
                ResultSetMetaData rsmd;
                int columnCount, count = 0;
                rsmd = rs.getMetaData();
                columnCount = rsmd.getColumnCount();

                for (int i = 2; i <= columnCount; i++) {
                    name = rsmd.getColumnName(i);
                    if ((prd.equals(name)) && (clsrm.equals("CR-601") || clsrm.equals("CR-602") || clsrm.equals("CR-603") || clsrm.equals("ComLAB-1") || clsrm.equals("ComLAB-2") || clsrm.equals("ComLAB-3"))) {
                        count = 1;
                        break;
                    }
                }
                if (count == 0) {
        %><h2>Cannot find Classroom or Period. <a href="three.jsp">Try Again</a></h2><%
        } else {
            rs = stmt.executeQuery("SELECT " + prd + " FROM Allocate WHERE ClassRoom = '" + clsrm + "'");
            while (rs.next()) {
                String chk = rs.getString(1);
                if (chk.equals("Allocated")) {
                    stmt.executeUpdate("UPDATE Allocate SET " + prd + "= 'X' WHERE ClassRoom = '" + clsrm + "' ");
        %><h3><% out.print(clsrm + " for " + prd + " has been unallocated."); %></h3>
        <br><br>
        <h2><a href="one.jsp">return</a></h2>
        <%
        } else {
        %><h3>Already Unallocated</h3><br>
        <br><br>
        <h2><a href="one.jsp">return</a></h2>
        <%
                        }
                    }
                }
            } catch (Exception e) {
                System.out.println(e);
            }

        %>
    </body>
</html>
