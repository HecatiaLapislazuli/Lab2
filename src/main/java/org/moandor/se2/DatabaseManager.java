package org.moandor.se2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DatabaseManager {
    private Connection mConnection;

    public DatabaseManager(Connection connection) {
        mConnection = connection;
    }

    public List<BookBean> getBooksByAuthorName(String authorName) throws SQLException {
        List<BookBean> result = new ArrayList<>();
        try (PreparedStatement statement = mConnection.prepareStatement("select Book.* from " +
                "Book inner join Author on Book.AuthorID = Author.AuthorID where " +
                "Author.Name = ?")) {
            statement.setString(1, authorName);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                result.add(resultSetToBook(resultSet));
            }
            return result;
        }
    }

    public BookBean getBook(String isbn) throws SQLException {
        try (PreparedStatement statement = mConnection.prepareStatement("select * from Book " +
                "where ISBN = ?")) {
            statement.setString(1, isbn);
            ResultSet resultSet = statement.executeQuery();
            if (!resultSet.next()) {
                return null;
            }
            return resultSetToBook(resultSet);
        }
    }

    public AuthorBean getAuthor(int id) throws SQLException {
        try (PreparedStatement statement = mConnection.prepareStatement("select * from Author " +
                "where AuthorID = ?")) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (!resultSet.next()) {
                return null;
            }
            return resultSetToAuthor(resultSet);
        }
    }

    public List<AuthorBean> getAuthors() throws SQLException {
        try (Statement statement = mConnection.createStatement()) {
            ResultSet resultSet = statement.executeQuery("select * from Author");
            List<AuthorBean> result = new ArrayList<>();
            while (resultSet.next()) {
                result.add(resultSetToAuthor(resultSet));
            }
            return result;
        }
    }

    public int insertAuthor(AuthorBean author) throws SQLException {
        try (PreparedStatement statement = mConnection.prepareStatement("insert into Author " +
                "(Name, Age, Country) values (?, ?, ?)", Statement.RETURN_GENERATED_KEYS)) {
            statement.setString(1, author.getName());
            statement.setInt(2, author.getAge());
            statement.setString(3, author.getCountry());
            int affected = statement.executeUpdate();
            if (affected == 0) {
                throw new SQLException("Insert author failed, no row affected.");
            }
            ResultSet generated = statement.getGeneratedKeys();
            if (generated.next()) {
                return generated.getInt(1);
            } else {
                throw new SQLException("Insert author failed, no ID generated.");
            }
        }
    }

    public void deleteBook(String isbn) throws SQLException {
        try (PreparedStatement statement = mConnection.prepareStatement("delete from Book " +
                "where ISBN = ?")) {
            statement.setString(1, isbn);
            statement.execute();
        }
    }

    public void insertBook(BookBean book) throws SQLException {
        try (PreparedStatement statement = mConnection.prepareStatement("insert into " +
                "Book values (?, ?, ?, ?, ?, ?)")) {
            statement.setString(1, book.getIsbn());
            statement.setString(2, book.getTitle());
            statement.setInt(3, book.getAuthorId());
            statement.setString(4, book.getPublisher());
            statement.setDate(5, book.getPublishDate());
            statement.setBigDecimal(6, book.getPrice());
            statement.execute();
        }
    }

    public void updateBook(BookBean book) throws SQLException {
        try (PreparedStatement statement = mConnection.prepareStatement("update Book " +
                "set Title = ?, AuthorID = ?, Publisher = ?, PublishDate = ?, " +
                "Price = ? where ISBN = ?")) {
            statement.setString(1, book.getTitle());
            statement.setInt(2, book.getAuthorId());
            statement.setString(3, book.getPublisher());
            statement.setDate(4, book.getPublishDate());
            statement.setBigDecimal(5, book.getPrice());
            statement.setString(6, book.getIsbn());
            statement.execute();
        }
    }

    private BookBean resultSetToBook(ResultSet resultSet) throws SQLException {
        BookBean book = new BookBean();
        book.setIsbn(resultSet.getString("ISBN"));
        book.setTitle(resultSet.getString("Title"));
        book.setAuthorId(resultSet.getInt("AuthorID"));
        book.setPublisher(resultSet.getString("Publisher"));
        book.setPublishDate(resultSet.getDate("PublishDate"));
        book.setPrice(resultSet.getBigDecimal("Price"));
        return book;
    }

    private AuthorBean resultSetToAuthor(ResultSet resultSet) throws SQLException {
        AuthorBean author = new AuthorBean();
        author.setId(resultSet.getInt("AuthorID"));
        author.setName(resultSet.getString("Name"));
        author.setAge(resultSet.getInt("Age"));
        author.setCountry(resultSet.getString("Country"));
        return author;
    }
}
