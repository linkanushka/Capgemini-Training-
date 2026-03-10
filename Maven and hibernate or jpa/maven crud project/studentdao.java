package com.example.jdbc.dao;

import java.sql.*;
import com.example.jdbc.util.DBConnection;

public class StudentDAO {

    public void insertStudent(int id,String name) throws Exception {

        Connection con = DBConnection.getConnection();

        String query="INSERT INTO student VALUES(?,?)";

        PreparedStatement ps = con.prepareStatement(query);

        ps.setInt(1,id);
        ps.setString(2,name);

        ps.executeUpdate();

        con.close();
    }

    public void displayStudents() throws Exception {

        Connection con = DBConnection.getConnection();

        Statement stmt = con.createStatement();

        ResultSet rs = stmt.executeQuery("SELECT * FROM student");

        while(rs.next()){

            System.out.println(rs.getInt(1)+" "+rs.getString(2));

        }

        con.close();
    }

}
