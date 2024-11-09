<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Mobile for You - Mobile List</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="top-division">
        <a href="home.html">Home</a>
        <a href="mobileList.jsp">Mobile List</a>
        <a href="comments.html">Comments</a>
    </div>
    <div class="information-division">
        <h2>Mobile List</h2>
        <table>
            <tr>
                <th>Make</th>
                <th>RAM (GB)</th>
            </tr>
            <%
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/yourDatabase", "username", "password");
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM Mobiles");
                    
                    while(rs.next()) {
                        String make = rs.getString("Mobile_make");
                        int ram = rs.getInt("RAM_size");
            %>
                        <tr>
                            <td><%= make %></td>
                            <td><%= ram %></td>
                        </tr>
            <%
                    }
                    conn.close();
                } catch(Exception e) {
                    e.printStackTrace();
                }
            %>
        </table>
    </div>
</body>
</html>
