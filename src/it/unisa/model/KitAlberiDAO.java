package it.unisa.model;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import it.unisa.beans.KitAlberi;
import it.unisa.beans.Albero;

public class KitAlberiDAO implements GenericDAO<KitAlberi> {

	private static DataSource ds;

	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/WoodLot");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}
	private static final String TABLE_NAME = "kit";

	@Override
	public KitAlberi doRetriveByKey(String code) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		KitAlberi bean = new KitAlberi();

		String selectSQL = "SELECT * FROM " + KitAlberiDAO.TABLE_NAME + "  WHERE id = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, Integer.parseInt(code));

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {

				bean.setDescrizione(rs.getString("descrizione"));
				bean.setId(rs.getInt("id"));
				bean.setNome(rs.getString("nome"));
				bean.setSaldo(rs.getInt("saldo"));
				bean.setAlberi(doRetriveByKit(bean.getId()));

			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return bean;
	}

	@Override
	public Collection<KitAlberi> doRetriveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<KitAlberi> beans = new ArrayList<KitAlberi>();
		String selectSQL = "SELECT * FROM " + KitAlberiDAO.TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				KitAlberi bean = new KitAlberi();

				bean.setDescrizione(rs.getString("descrizione"));
				bean.setId(rs.getInt("id"));
				bean.setNome(rs.getString("nome"));
				bean.setSaldo(rs.getInt("saldo"));
				bean.setAlberi(doRetriveByKit(bean.getId()));

				beans.add(bean);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return beans;

	}

	public void doSave(KitAlberi item) throws SQLException {
		String insertOrder = "INSERT INTO " + KitAlberiDAO.TABLE_NAME + " (nome, saldo, descrizione)"
				+ " VALUES (?, ?, ?)";
		String insertItem = "INSERT INTO kit_alberi(pid,kid) " + "VALUES (?, ?)";
		var conn = ds.getConnection();
		conn.setAutoCommit(false);
		try (var stmt = conn.prepareStatement(insertOrder, Statement.RETURN_GENERATED_KEYS)) {
			stmt.setString(1, item.getNome());
			stmt.setDouble(2, item.getSaldo());
			stmt.setString(3, item.getDescrizione());

			stmt.executeUpdate();

			ResultSet rs = stmt.getGeneratedKeys();
			if (rs.next()) {
				int lastInsertedId = rs.getInt(1);

				for (Albero i : item.getAlberi()) {
					var stmt2 = conn.prepareStatement(insertItem);
					stmt2.setInt(1, i.getId());
					stmt2.setInt(2, lastInsertedId);

					stmt2.execute();
				}
			}
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			conn.rollback();
		}

	}

	@Override
	public int doUpdate(KitAlberi item) throws SQLException {

		String updateOrder = "UPDATE " + KitAlberiDAO.TABLE_NAME + " SET nome = ?, saldo=?, descrizione =? "
				+ "WHERE id = ? ";
		String insertItem = "INSERT INTO kit_alberi(pid,kid) " + "VALUES (?, ?)";
		String deleteSQL = "DELETE FROM kit_alberi WHERE kid = ?";
		var conn = ds.getConnection();
		PreparedStatement preparedStatement = null;
		try {
			var stmt = conn.prepareStatement(updateOrder);
			stmt.setString(1, item.getNome());
			stmt.setDouble(2, item.getSaldo());
			stmt.setString(3, item.getDescrizione());
			stmt.setInt(4, item.getId());
			stmt.executeUpdate();

			preparedStatement = conn.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, item.getId());

			preparedStatement.executeUpdate();
			for (Albero i : item.getAlberi()) {
				var stmt2 = conn.prepareStatement(insertItem);
				stmt2.setInt(1, i.getId());
				stmt2.setInt(2, item.getId());

				stmt2.execute();
			}
		} catch (SQLException e) {
			e.printStackTrace();
			conn.rollback();
		}

		return 0;
	}

	@Override
	public boolean doDelete(KitAlberi item) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM " + KitAlberiDAO.TABLE_NAME + " WHERE id = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, item.getId());

			result = preparedStatement.executeUpdate();

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}

		return (result != 0);
	}

	public Collection<Albero> doRetriveByKit(int code) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		AlberoDAO model = new AlberoDAO();

		Collection<Albero> beans = new ArrayList<Albero>();
		String selectSQL = "SELECT * FROM WOODLOT.prodotto as p, kit as k, kit_alberi as ka  WHERE k.id=? AND p.id=ka.pid AND k.id=ka.kid";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				Albero bean = new Albero();

				bean.setAltezza(rs.getDouble("altezza"));
				bean.setCo2(rs.getInt("co2"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setDescrizioneBreve(rs.getString("descrizioneBreve"));
				bean.setId(rs.getInt("id"));
				bean.setNome(rs.getString("nome"));
				bean.setNomeScientifico(rs.getString("nomeScientifico"));
				bean.setOnSale(rs.getInt("onSale"));
				bean.setPaeseDiOrigine(rs.getString("pid"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setQuantità(rs.getInt("quantità"));
				bean.setSalvaguardia(rs.getInt("Salvaguardia"));
				bean.setCategories(model.findProductCategory(bean.getId()));
				bean.setDoveVienePiantato(rs.getString("doveVienePiantato"));
				bean.setSottotitolo(rs.getString("sottotitolo"));
				bean.setSaldo(rs.getDouble("saldo"));
				bean.setTasse(rs.getDouble("tasse"));
				bean.setDisponibile(rs.getBoolean("disponibile"));

				beans.add(bean);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return beans;
	}

	public synchronized static byte[] load(String id) {

		Connection connection = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		byte[] bt = null;

		try {
			connection = ds.getConnection();
			String sql = "SELECT foto FROM kit  WHERE id = ?";
			stmt = connection.prepareStatement(sql);

			stmt.setInt(1, Integer.parseInt(id));
			rs = stmt.executeQuery();

			if (rs.next()) {
				bt = rs.getBytes("foto");
			}

		} catch (SQLException sqlException) {
			System.out.println(sqlException);
		} finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException sqlException) {
				System.out.println(sqlException);
			} finally {
				if (connection != null)
					try {
						connection.close();
					} catch (SQLException e) {
						System.out.println(e);
					}
			}
		}
		return bt;

	}

	public synchronized static void updatePhoto(int id, String photo) throws SQLException {
		Connection con = null;
		PreparedStatement stmt = null;

		try {
			con = ds.getConnection();
			stmt = con.prepareStatement("UPDATE kit SET foto = ? WHERE id= ?");

			File file = new File(photo);
			try {
				FileInputStream fis = new FileInputStream(file);
				stmt.setBinaryStream(1, fis, fis.available());
				stmt.setInt(2, id);

				stmt.executeUpdate();
				con.commit();
			} catch (FileNotFoundException e) {
				System.out.println(e);
			} catch (IOException e) {
				System.out.println(e);
			}
		} finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException sqlException) {
				System.out.println(sqlException);
			} finally {
				if (con != null)
					con.close();
			}
		}
	}

}
