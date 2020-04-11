

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PostDAO
 */
@WebServlet("/PostDAO")
public class PostDAO extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connect = null;
	private Statement statement = null;
	private PreparedStatement preparedStatement = null;
	private ResultSet resultSet = null;
    
	public PostDAO() {
    
    }
    
    protected void connect_func() throws SQLException {
        if (connect == null || connect.isClosed()) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new SQLException(e);
            }
            connect = (Connection) DriverManager
  			      .getConnection("jdbc:mysql://127.0.0.1:3306/comedian?" // change schema name to match also on line 
  			          + "user=root&password=glamboy99");
            System.out.println(connect);
        }
    }
    
    protected void disconnect() throws SQLException {
        if (connect != null && !connect.isClosed()) {
        	connect.close();
        }
    }
    
    public List<Post> listAllPosts() throws SQLException {
        List<Post> listPost = new ArrayList<Post>();        
        String sql = "SELECT * FROM posts";      
        connect_func();      
        statement =  (Statement) connect.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);
         
        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String comedian = resultSet.getString("comedian");
            String url = resultSet.getString("url");
            String title = resultSet.getString("title");
            String description = resultSet.getString("description");
            String tags = resultSet.getString("tags");
            String score = resultSet.getString("score");
            String comment = resultSet.getString("comment");
             
            Post post = new Post(id,comedian,url, title, description, tags, score, comment);
            listPost.add(post);
        }        
        resultSet.close();
        statement.close();         
        disconnect();        
        return listPost;
    }
    
    public boolean insert(Post post) throws SQLException {
    	connect_func();         
		String sql = "insert into posts(comedian, url, title, description, tags, score, comment) values (?, ?, ?, ?, ?, ?, ?)";
		preparedStatement = (PreparedStatement) connect.prepareStatement(sql);
		preparedStatement.setString(1, post.comedian);
		preparedStatement.setString(2, post.url);
		preparedStatement.setString(3, post.title);
		preparedStatement.setString(4, post.description);
		preparedStatement.setString(5, post.tags);
		preparedStatement.setString(6, post.score);
		preparedStatement.setString(7, post.comment);
		
//		preparedStatement.executeUpdate();
		
        boolean rowInserted = preparedStatement.executeUpdate() > 0;
        preparedStatement.close();
//        disconnect();
        return rowInserted;
    }
    
    public boolean update(Post post) throws SQLException {
        String sql = "update posts set comedian=?, url=?, title =?,description = ?, tags = ?, score = ?, comment = ? where id = ?";
        connect_func();
        
        preparedStatement = (PreparedStatement) connect.prepareStatement(sql);
        preparedStatement.setString(1, post.comedian);
        preparedStatement.setString(2, post.url);
        preparedStatement.setString(3, post.title);
        preparedStatement.setString(4, post.description);
        preparedStatement.setString(5, post.tags);
        preparedStatement.setString(6, post.score);
        preparedStatement.setString(7, post.comment);
        preparedStatement.setInt(8, post.id);
         
        boolean rowUpdated = preparedStatement.executeUpdate() > 0;
        preparedStatement.close();
//        disconnect();
        return rowUpdated;     
    }
    
    public Post getPost(int id) throws SQLException {
    	Post post = null;
        String sql = "SELECT * FROM posts WHERE id = ?";
         
        connect_func();
         
        preparedStatement = (PreparedStatement) connect.prepareStatement(sql);
        preparedStatement.setInt(1, id);
         
        ResultSet resultSet = preparedStatement.executeQuery();
         
        if (resultSet.next()) {
        	String comedian = resultSet.getString("comedian");
            String url = resultSet.getString("url");
            String title = resultSet.getString("title");
            String description = resultSet.getString("description");
            String tags = resultSet.getString("tags");
            String score = resultSet.getString("score");
            String comment = resultSet.getString("comment");
             
            post = new Post(id, comedian, url, title, description, tags, score, comment);
        }
         
        resultSet.close();
        statement.close();
         
        return post;
    }
    
    

}
