package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Collection;
import java.util.LinkedList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import it.unisa.beans.Categoria;
import it.unisa.beans.UsoLocale;
import it.unisa.beans.Albero;
import it.unisa.beans.Beneficio;

public class AlberoDAO implements GenericDAO<Albero> {

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

	private static final String TABLE_NAME = "prodotto";

	@Override
	public synchronized Albero doRetriveByKey(String code) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		PaeseDiOrigineDAO dao = new PaeseDiOrigineDAO();
		Albero bean = new Albero();

		String selectSQL = "SELECT * FROM " + AlberoDAO.TABLE_NAME + " WHERE id = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, Integer.parseInt(code));

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {

				bean.setAltezza(rs.getDouble("altezza"));
				bean.setCo2(rs.getInt("co2"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setDescrizioneBreve(rs.getString("descrizioneBreve"));
				bean.setId(rs.getInt("id"));
				bean.setNome(rs.getString("nome"));
				bean.setNomeScientifico(rs.getString("nomeScientifico"));
				bean.setPaeseDiOrigine(dao.doRetriveByKey(rs.getString("pid")));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setTasse(rs.getDouble("tasse"));
				bean.setSalvaguardia(rs.getInt("Salvaguardia"));
				bean.setCategories(findProductCategory(bean.getId()));
				bean.setSottotitolo(rs.getString("sottotitolo"));
				bean.setBenefici(findProductBenefits(bean.getId()));
				bean.setCategorie(findProductCategory(bean.getId()));
				bean.setUsiLocali(findProductUsiLocali(bean.getId()));
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
	public synchronized Collection<Albero> doRetriveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		PaeseDiOrigineDAO dao = new PaeseDiOrigineDAO();
		Collection<Albero> beans = new LinkedList<Albero>();

		String selectSQL = "SELECT * FROM " + AlberoDAO.TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				Albero bean = new Albero();

				bean.setAltezza(rs.getDouble("altezza"));
				bean.setCo2(rs.getInt("co2"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setDescrizioneBreve(rs.getString("descrizioneBreve"));
				bean.setId(rs.getInt("id"));
				bean.setNome(rs.getString("nome"));
				bean.setNomeScientifico(rs.getString("nomeScientifico"));
				bean.setPaeseDiOrigine(dao.doRetriveByKey(rs.getString("pid")));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setSalvaguardia(rs.getInt("Salvaguardia"));
				bean.setCategories(findProductCategory(bean.getId()));
				bean.setSottotitolo(rs.getString("sottotitolo"));
				bean.setCategorie(findProductCategory(bean.getId()));
				bean.setUsiLocali(findProductUsiLocali(bean.getId()));
				bean.setBenefici(findProductBenefits(bean.getId()));
				bean.setTasse(rs.getDouble("tasse"));
				beans.add(bean);
			}
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				try {
					if (connection != null) {
						connection.close();
					}
				} finally {
					if (rs != null)
						rs.close();
				}
			}
		}

		return beans;
	}

	// quando viene inserito devo vedere bene pure quali tab si modificano
	@Override
	public synchronized void doSave(Albero item) throws SQLException {

		String insertSQL = "INSERT INTO " + AlberoDAO.TABLE_NAME
				+ " (nome, nomeScientifico, descrizione, descrizioneBreve, altezza, prezzo,"
				+ " pid, co2, salvaguardia, sottotitolo, tasse) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)";

		String insertUso = "INSERT INTO albero_usiLocali (pid,uid) VALUES (?,?)";
		String insertBenfit = "INSERT INTO benefici_prodotti (pid,cid,percentuale) VALUES (?,?,?)";
		String insertCat = "INSERT INTO categorie_prodotti (pid,cid) VALUES (?,?)";
		String insertPhoto = "INSERT INTO fotoProdotto (pid) VALUES (?)";

		var conn = ds.getConnection();
		conn.setAutoCommit(false);
		try (var stmt = conn.prepareStatement(insertSQL, Statement.RETURN_GENERATED_KEYS)) {
			stmt.setString(1, item.getNome());
			stmt.setString(2, item.getNomeScientifico());
			stmt.setString(3, item.getDescrizione());
			stmt.setString(4, item.getDescrizioneBreve());
			stmt.setDouble(5, item.getAltezza());
			stmt.setDouble(6, item.getPrezzo());
			stmt.setString(7, item.getPaeseDiOrigine().getNome());
			stmt.setDouble(8, item.getCo2());
			stmt.setDouble(9, item.getSalvaguardia());
			stmt.setString(10, item.getSottotitolo());
			stmt.setDouble(11, item.getTasse());
			stmt.executeUpdate();

			ResultSet rs = stmt.getGeneratedKeys();
			if (rs.next()) {
				int lastInsertedId = rs.getInt(1);
				for (UsoLocale u : item.getUsiLocali()) {
					var stmt2 = conn.prepareStatement(insertUso);
					stmt2.setInt(1, lastInsertedId);
					stmt2.setInt(2, u.getId());

					stmt2.execute();
				}

				for (Beneficio b : item.getBenefici()) {
					var stmt2 = conn.prepareStatement(insertBenfit);
					stmt2.setInt(1, lastInsertedId);
					stmt2.setInt(2, b.getId());
					stmt2.setDouble(3, b.getPercentuale());

					stmt2.execute();
				}

				for (Categoria c : item.getCategorie()) {
					var stmt2 = conn.prepareStatement(insertCat);
					stmt2.setInt(1, lastInsertedId);
					stmt2.setInt(2, c.getId());

					stmt2.execute();
				}

				for (int i = 0; i < 3; i++) {
					var stmt2 = conn.prepareStatement(insertPhoto);
					stmt2.setInt(1, lastInsertedId);
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
	public int doUpdate(Albero item) throws SQLException {
		String update = "UPDATE  prodotto SET nome = ?, nomeScientifico = ?, descrizione = ?, descrizioneBreve = ?, prezzo=?, sottotitolo = ?,"
				+ "altezza = ?, pid = ?, co2 = ?, salvaguardia = ?, tasse = ?  " + " WHERE id = ? ";

		String updateBenfit = "UPDATE benefici_prodotti  SET percentuale =?  WHERE  pid =? AND cid=?";

		String deleteCat = "DELETE FROM categorie_prodotti WHERE pid=?";
		String insertCat = "INSERT INTO categorie_prodotti (pid,cid) VALUES (?,?)";

		String insertUso = "INSERT INTO albero_usiLocali (pid,uid) VALUES (?,?)";
		String deleteUso = "DELETE FROM albero_usiLocali WHERE pid=?";

		var conn = ds.getConnection();
		conn.setAutoCommit(false);
		try (var stmt = conn.prepareStatement(update, Statement.RETURN_GENERATED_KEYS)) {

			stmt.setString(1, item.getNome());
			stmt.setString(2, item.getNomeScientifico());
			stmt.setString(3, item.getDescrizione());
			stmt.setString(4, item.getDescrizioneBreve());
			stmt.setDouble(5, item.getPrezzo());
			stmt.setString(6, item.getSottotitolo());
			stmt.setDouble(7, item.getAltezza());
			stmt.setString(8, item.getPaeseDiOrigine().getNome());
			stmt.setInt(9, item.getCo2());
			stmt.setInt(10, item.getSalvaguardia());
			stmt.setDouble(11, item.getTasse());
			stmt.setInt(12, item.getId());

			stmt.executeUpdate();

			for (Beneficio b : item.getBenefici()) {
				var stmt2 = conn.prepareStatement(updateBenfit);
				stmt2.setInt(1, item.getId());
				stmt2.setInt(2, b.getId());
				stmt2.setDouble(3, b.getPercentuale());

				stmt2.executeUpdate();
			}

			var stmt2 = conn.prepareStatement(deleteCat);
			stmt2.setInt(1, item.getId());
			stmt2.execute();

			for (Categoria c : item.getCategorie()) {
				var stmt3 = conn.prepareStatement(insertCat);
				stmt3.setInt(1, item.getId());
				stmt3.setInt(2, c.getId());

				stmt3.executeUpdate();
			}

			var stmt4 = conn.prepareStatement(deleteUso);
			stmt4.setInt(1, item.getId());
			stmt4.execute();

			for (UsoLocale u : item.getUsiLocali()) {
				var stmt5 = conn.prepareStatement(insertUso);
				stmt5.setInt(1, item.getId());
				stmt5.setInt(2, u.getId());

				stmt5.executeUpdate();
			}
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			conn.rollback();
		}

		return 0;
	}

	@Override
	public synchronized boolean doDelete(Albero item) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM " + AlberoDAO.TABLE_NAME + " WHERE id = ?";

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

	public synchronized Collection<Beneficio> findProductBenefits(int id) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<Beneficio> cats = new LinkedList<Beneficio>();
		String selectSQL = "SELECT * FROM benefici AS b, benefici_prodotti AS cp" + " WHERE cp.cid=b.id AND pid=? ";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, id);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				Beneficio bean = new Beneficio();

				bean.setId(rs.getInt("id"));
				bean.setNome(rs.getString("nome"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setPercentuale(rs.getDouble("percentuale"));

				cats.add(bean);
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
		return cats;
	}

	public synchronized Collection<Categoria> findProductCategory(int id) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<Categoria> cats = new LinkedList<Categoria>();
		String selectSQL = "SELECT * FROM categoria AS c, categorie_prodotti AS cp\n" + " WHERE cp.cid=c.id AND pid=? ";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, id);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				Categoria bean = new Categoria();

				bean.setId(rs.getInt("id"));
				bean.setNome(rs.getString("nome"));
				bean.setDescrizione(rs.getString("descrizione"));

				cats.add(bean);
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
		return cats;
	}

	public synchronized Collection<UsoLocale> findProductUsiLocali(int id) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<UsoLocale> cats = new LinkedList<UsoLocale>();
		String selectSQL = "SELECT * FROM usiLocali WHERE id IN (SELECT uid FROM albero_usiLocali WHERE pid=?) ";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, id);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				UsoLocale bean = new UsoLocale();

				bean.setId(rs.getInt("id"));
				bean.setNome(rs.getString("nome"));
				bean.setDescrizione(rs.getString("descrizione"));

				cats.add(bean);
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
		return cats;
	}

	public synchronized Collection<Albero> findProducbyCategory(int category) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<Albero> prods = new LinkedList<Albero>();
		String selectSQL = "SELECT * FROM categorie_prodotti AS c, prodotto AS p WHERE cid=? AND (c.pid=p.id)";
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, category);

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
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setSalvaguardia(rs.getInt("Salvaguardia"));
				bean.setCategories(findProductCategory(bean.getId()));
				bean.setSottotitolo(rs.getString("sottotitolo"));

				prods.add(bean);
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
		return prods;
	}
}
