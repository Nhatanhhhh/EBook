package com.DAO;

import com.DB.DBConnect;
import com.entity.GitHubUser;
import com.entity.GoogleUser;
import com.entity.InterfaceUser;
import com.entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Nhat_Anh
 */
public class UserDAOImpl implements UserDAO {

    private Connection conn;

    public UserDAOImpl(Connection conn) {
        super();
        this.conn = conn;
    }

    @Override
    public boolean userRegister(User us) {
        boolean f = false;
        try {
            String sql = "INSERT INTO [dbo].[User](Name, Email, PhoneNo, Password) VALUES(?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, us.getName());
            ps.setString(2, us.getEmail());
            ps.setString(3, us.getPhno());
            ps.setString(4, us.getPassword());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public User login(String email, String password) {
        User us = null;

        try {
            String sql = "SELECT u.[ID], u.[Name], u.[Email], u.[PhoneNo], u.[Password], u.[Address], u.[Landmark], u.[City], u.[State], u.[Pincode] FROM [dbo].[User] u WHERE u.[Email]=? AND u.[Password]=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                us = new User();
                us.setUserID(rs.getInt(1));
                us.setName(rs.getString(2));
                us.setEmail(rs.getString(3));
                us.setPhno(rs.getString(4));
                us.setPassword(rs.getString(5));
                us.setAddress(rs.getString(6));
                us.setLandmark(rs.getString(7));
                us.setCity(rs.getString(8));
                us.setState(rs.getString(9));
                us.setPincode(rs.getString(10));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return us;
    }

    @Override
    public User getUserByEmail(String email) {
        User us = null;

        try {
            String sql = "SELECT [ID], [Name], [Email], [PhoneNo], [Password], [Address], [Landmark], [City], [State], [Pincode] "
                    + "FROM [dbo].[User] WHERE [Email] = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                us = new User();
                us.setUserID(rs.getInt("ID"));
                us.setName(rs.getString("Name"));
                us.setEmail(rs.getString("Email"));
                us.setPhno(rs.getString("PhoneNo"));
                us.setPassword(rs.getString("Password"));
                us.setAddress(rs.getString("Address"));
                us.setLandmark(rs.getString("Landmark"));
                us.setCity(rs.getString("City"));
                us.setState(rs.getString("State"));
                us.setPincode(rs.getString("Pincode"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return us;
    }

    @Override
    public int getLastInsertedUserID() throws SQLException {
        int lastInsertedID = -1;
        String sql = "SELECT SCOPE_IDENTITY() AS lastID";

        try ( PreparedStatement ps = conn.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                lastInsertedID = rs.getInt("lastID");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("Error while fetching last inserted User ID.", e);
        }

        return lastInsertedID;
    }

    @Override
    public boolean registerGoogleUser(User user, GoogleUser googleUser) {
        boolean isSuccess = false;
        Connection conn = null;
        try {
            conn = DBConnect.getConn();
            conn.setAutoCommit(false);

            String insertUserSQL = "INSERT INTO [dbo].[User](Name, Email) VALUES(?,?)";
            PreparedStatement userStmt = conn.prepareStatement(insertUserSQL, Statement.RETURN_GENERATED_KEYS);
            userStmt.setString(1, user.getName());
            userStmt.setString(2, user.getEmail());
            int rowsAffectedUser = userStmt.executeUpdate();

            if (rowsAffectedUser == 1) {
                ResultSet generatedKeys = userStmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int userID = generatedKeys.getInt(1);

                    String insertGoogleUserSQL = "INSERT INTO [dbo].[UserGoogle](GoogleID, UserID, GGEmail, GGName, AuthToken) VALUES(?,?,?,?,?)";
                    PreparedStatement googleUserStmt = conn.prepareStatement(insertGoogleUserSQL);
                    googleUserStmt.setString(1, googleUser.getGoogleID());
                    googleUserStmt.setInt(2, userID);
                    googleUserStmt.setString(3, googleUser.getGGEmail());
                    googleUserStmt.setString(4, googleUser.getGGName());
                    googleUserStmt.setString(5, googleUser.getAuthToken());

                    int rowsAffectedGoogleUser = googleUserStmt.executeUpdate();

                    if (rowsAffectedGoogleUser == 1) {
                        conn.commit();
                        isSuccess = true;
                    } else {
                        conn.rollback();
                    }
                }
            } else {
                conn.rollback();
            }
        } catch (SQLException e) {
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.setAutoCommit(true);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return isSuccess;
    }

    @Override
    public GoogleUser loginGoogle(String googleID) {
        GoogleUser gu = null;

        try {
            String sql = "SELECT * FROM [dbo].[UserGoogle] WHERE [GoogleID]=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, googleID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                gu = new GoogleUser();
                gu.setGoogleID(rs.getString("GoogleID"));
                gu.setUserID(rs.getInt("UserID"));
                gu.setGGEmail(rs.getString("GGEmail"));
                gu.setGGName(rs.getString("GGName"));
                gu.setAuthToken(rs.getString("AuthToken"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return gu;
    }

    @Override
    public boolean saveGitHubUser(GitHubUser user) {
        boolean isSuccess = false;
        try {
            if (user.getGithubID() == null || user.getGithubID().isEmpty()) {
                throw new SQLException("GithubID is null or empty.");
            }

            String sql = "INSERT INTO [dbo].[UserGithub]([GithubID], [UserID], [GHEmail], [GHName], [PhoneNo], [AuthToken], [Password], [Address], [Landmark], [City], [State], [Pincode]) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user.getGithubID());
            ps.setInt(2, user.getUserID());
            ps.setString(3, user.getGHEmail());
            ps.setString(4, user.getGHName());
            ps.setString(5, user.getPhno());
            ps.setString(6, user.getAuthToken());
            ps.setString(7, user.getPassword());
            ps.setString(8, user.getAddress());
            ps.setString(9, user.getLandmark());
            ps.setString(10, user.getCity());
            ps.setString(11, user.getState());
            ps.setString(12, user.getPincode());

            int i = ps.executeUpdate();
            if (i == 1) {
                isSuccess = true;
            }
        } catch (SQLException e) {
            if (e.getErrorCode() == 2627) {
                System.out.println("User with GithubID " + user.getGithubID() + " already exists.");
            } else {
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }

    @Override
    public boolean registerGitHubUser(User user, GitHubUser gitHubUser) {
        boolean isSuccess = false;
        Connection conn = null;
        try {
            conn = DBConnect.getConn();
            conn.setAutoCommit(false);

            String insertUserSQL = "INSERT INTO [dbo].[User](Name, Email) VALUES(?,?)";
            PreparedStatement userStmt = conn.prepareStatement(insertUserSQL, Statement.RETURN_GENERATED_KEYS);
            userStmt.setString(1, user.getName());
            userStmt.setString(2, user.getEmail());
            int rowsAffectedUser = userStmt.executeUpdate();

            if (rowsAffectedUser == 1) {
                ResultSet generatedKeys = userStmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int userID = generatedKeys.getInt(1);

                    String insertGitHubUserSQL = "INSERT INTO [dbo].[UserGithub](GithubID, UserID, GHEmail, GHName, AuthToken) VALUES(?,?,?,?,?)";
                    PreparedStatement gitHubUserStmt = conn.prepareStatement(insertGitHubUserSQL);
                    gitHubUserStmt.setString(1, gitHubUser.getGithubID());
                    gitHubUserStmt.setInt(2, userID);
                    gitHubUserStmt.setString(3, gitHubUser.getGHEmail());
                    gitHubUserStmt.setString(4, gitHubUser.getGHName());
                    gitHubUserStmt.setString(5, gitHubUser.getAuthToken());

                    int rowsAffectedGitHubUser = gitHubUserStmt.executeUpdate();

                    if (rowsAffectedGitHubUser == 1) {
                        conn.commit();
                        isSuccess = true;
                    } else {
                        conn.rollback();
                    }
                }
            } else {
                conn.rollback();
            }
        } catch (SQLException e) {
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.setAutoCommit(true);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return isSuccess;
    }

    @Override
    public GitHubUser loginGitHub(String gitHubID) {
        GitHubUser gu = null;

        try {
            String sql = "SELECT * FROM [dbo].[UserGithub] WHERE [GithubID]=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, gitHubID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                gu = new GitHubUser();
                gu.setGithubID(rs.getString("GithubID"));
                gu.setUserID(rs.getInt("UserID"));
                gu.setGHEmail(rs.getString("GHEmail"));
                gu.setGHName(rs.getString("GHName"));
                gu.setAuthToken(rs.getString("AuthToken"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return gu;
    }

    @Override
    public boolean checkPassword(int id, String ps) {
        boolean passwordExists = false;
        String hashedPassword = DBConnect.hashPasswordMD5(ps);

        try {
            // Step 1: Check if the password exists for the user in the User table
            String checkSql = "SELECT Password FROM [dbo].[User] WHERE [ID] = ?";
            try ( PreparedStatement checkPst = conn.prepareStatement(checkSql)) {
                checkPst.setInt(1, id);
                try ( ResultSet rs = checkPst.executeQuery()) {
                    if (rs.next()) {
                        String storedPassword = rs.getString("Password");

                        // Step 2: If User's password is null, update it
                        if (storedPassword == null) {
                            String updateUserSql = "UPDATE [dbo].[User] SET [Password] = ? WHERE [ID] = ?";
                            try ( PreparedStatement updateUserPst = conn.prepareStatement(updateUserSql)) {
                                updateUserPst.setString(1, hashedPassword);
                                updateUserPst.setInt(2, id);
                                updateUserPst.executeUpdate();
                            }
                            passwordExists = true;  // Password is now set in the User table
                        } else {
                            passwordExists = storedPassword.equals(hashedPassword);  // Verify password
                        }

                        // Step 3: Update password in UserGoogle if it exists and is null
                        String updateGoogleSql = "UPDATE [dbo].[UserGoogle] SET [Password] = ? WHERE [UserID] = ? AND [Password] IS NULL";
                        try ( PreparedStatement updateGooglePst = conn.prepareStatement(updateGoogleSql)) {
                            updateGooglePst.setString(1, hashedPassword);
                            updateGooglePst.setInt(2, id);
                            updateGooglePst.executeUpdate();
                        }

                        // Step 4: Update password in UserGithub if it exists and is null
                        String updateGithubSql = "UPDATE [dbo].[UserGithub] SET [Password] = ? WHERE [UserID] = ? AND [Password] IS NULL";
                        try ( PreparedStatement updateGithubPst = conn.prepareStatement(updateGithubSql)) {
                            updateGithubPst.setString(1, hashedPassword);
                            updateGithubPst.setInt(2, id);
                            updateGithubPst.executeUpdate();
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return passwordExists;
    }

    @Override
    public boolean updateProfile(User us) {
        boolean f = false;
        try {
            String sql = "UPDATE [dbo].[User] SET [Name] = ?, [Email] = ?, [PhoneNo] = ? WHERE [ID] = ? ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, us.getName());
            ps.setString(2, us.getEmail());
            ps.setString(3, us.getPhno());
            ps.setInt(4, us.getUserID());

            int i = ps.executeUpdate();
            if (i == 1) {
                return f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

}
