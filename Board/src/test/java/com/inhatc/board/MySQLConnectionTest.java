package com.inhatc.board;

import java.sql.Connection;
import java.sql.DriverManager;
import org.junit.Test;

public class MySQLConnectionTest {
@Test
public void test() throws Exception {
    Class.forName("org.mariadb.jdbc.Driver");

    Connection con = DriverManager.getConnection(
          "jdbc:mariadb://114.71.137.109/Mok", 
          "root",
          "tmvlflt1234" );//
    System.out.println(con);
    }
}