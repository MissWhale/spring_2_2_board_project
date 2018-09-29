package com.inhatc.board;

import java.sql.Connection;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//;import org.springframework.test.context.web.WebAppConfiguration;

@RunWith(SpringJUnit4ClassRunner.class)
//@WebAppConfiguration
@ContextConfiguration(
	locations ={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})



public class DataSourceTest {

	@Inject
	private DataSource ds;
	
	@Test
	public void testConection()throws Exception{
		
		try(Connection con = ds.getConnection()){
			
			System.out.println(con);
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}




/*package com.inhatc.cs;

import java.sql.Connection;
import javax.inject.Inject ;
import javax.sql.DataSource;

import org.junit.runner.RunWith;
import org.junit.Test ;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;



@RunWith(SpringJUnit4ClassRunner.class)

*/
//@ContextConfiguration( locations = {"file:src/main/webapp/WEB-INF/spring/**/Root-context.xml"})
/*
public class DataSourceTest {

	@Inject private DataSource ds ;
	
	@Test
	public void testCionnection() throws Exception{
		try (Connection con = ds.getConnection() ){
			System.out.println(con);;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}

*/