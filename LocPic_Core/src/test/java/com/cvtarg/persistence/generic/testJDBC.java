package com.cvtarg.persistence.generic;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class testJDBC {

	/**
	 * @param args
	 */

	public static void main(String[] args) {
		testJdbc();
		// testJpa();
	}

	public static void testJdbc() {

		String url = "jdbc:postgresql://192.168.150.90:5432/gdr_272";
		Properties props = new Properties();
		props.setProperty("user", "gdr");
		props.setProperty("password", "gdr1324");
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, props);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select id from SYSTEMUSER");
			while (rs.next()) {
				long id = rs.getLong(1);
				System.out.println("ID:" + id);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	/*
	 * public static void testJpa() {
	 * 
	 * // Use persistence.xml configuration EntityManagerFactory emf =
	 * Persistence.createEntityManagerFactory("pu1"); EntityManager em =
	 * emf.createEntityManager(); // Retrieve an application managed entity
	 * manager
	 * 
	 * // Work with the EM MapEntity map = new MapEntity(); map.setId(5);
	 * 
	 * EntityTransaction transaction = em.getTransaction(); transaction.begin();
	 * em.persist(map); transaction.commit(); em.close(); emf.close(); //close
	 * at application end // Create EntityManagerFactory for persistent unit
	 * named "pu1" // to be used in this test }
	 */
}