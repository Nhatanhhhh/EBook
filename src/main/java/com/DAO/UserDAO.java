package com.DAO;

import com.entity.GitHubUser;
import com.entity.GoogleUser;
import com.entity.User;
import java.sql.SQLException;

/**
 *
 * @author Nhat_Anh
 */
public interface UserDAO{
    public int getLastInsertedUserID() throws SQLException;
    
    public User getUserByEmail(String email);
    
    public boolean userRegister(User us);
    
    public boolean registerGoogleUser(User user, GoogleUser googleUser);
    
    public User login(String email, String password);
    
    public GoogleUser loginGoogle(String googleID);
    
    public boolean saveGitHubUser(GitHubUser user);
    
    public boolean registerGitHubUser(User user, GitHubUser gitHubUser);
    
    public GitHubUser loginGitHub(String gitHubID);
}
