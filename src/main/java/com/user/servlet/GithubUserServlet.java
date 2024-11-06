/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.user.servlet;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.Properties;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.GitHubUser;
import com.entity.User;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Nhat_Anh
 */
public class GithubUserServlet extends HttpServlet {

    private String CLIENT_ID = GITHUB_CLIENT_ID;
    private String CLIENT_SECRET = GITHUB_CLIENT_SECRET;
    private String REDIRECT_URI = GITHUB_REDIRECT_URI;

    @Override
    public void init() throws ServletException {
        // Load configuration from properties file
        try ( InputStream input = getServletContext().getResourceAsStream("/WEB-INF/config.properties")) {
            Properties prop = new Properties();
            if (input == null) {
                throw new FileNotFoundException("Property file not found in the classpath");
            }
            // Load properties file
            prop.load(input);
            CLIENT_ID = prop.getProperty("GITHUB_CLIENT_ID");
            CLIENT_SECRET = prop.getProperty("GITHUB_CLIENT_SECRET");
            REDIRECT_URI = prop.getProperty("GITHUB_REDIRECT_URI");
        } catch (IOException ex) {
            throw new ServletException("Could not load configuration properties", ex);
        }

        if (CLIENT_ID == null || CLIENT_SECRET == null || REDIRECT_URI == null) {
            throw new ServletException("Missing required configuration properties.");
        }
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GithubUserServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GithubUserServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");

        if (code != null) {
            try {
                String accessToken = getAccessToken(code);
                if (accessToken != null) {
                    String userInfo = getUserInfo(accessToken);
                    JsonObject userJson = JsonParser.parseString(userInfo).getAsJsonObject();
                    String githubID = userJson.has("id") ? userJson.get("id").getAsString() : null;
                    String email = userJson.has("email") && !userJson.get("email").isJsonNull() ? userJson.get("email").getAsString() : null;
                    String name = userJson.has("name") && !userJson.get("name").isJsonNull() ? userJson.get("name").getAsString() : null;

                    if (email == null) {
                        email = getPrimaryEmail(accessToken);
                    }

                    UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
                    GitHubUser existingUser = dao.loginGitHub(githubID);
                    HttpSession session = request.getSession(true);

                    if (existingUser != null) {
                        session.setAttribute("userObj", existingUser);
                    } else {
                        // Create new user and insert into User and GitHubUser tables
                        User newUser = new User();
                        newUser.setName(name);
                        newUser.setEmail(email);

                        GitHubUser newGitHubUser = new GitHubUser();
                        newGitHubUser.setGithubID(githubID);
                        newGitHubUser.setGHEmail(email);
                        newGitHubUser.setGHName(name);
                        newGitHubUser.setAuthToken(accessToken);

                        if (dao.registerGitHubUser(newUser, newGitHubUser)) {
                            session.setAttribute("userObj", newGitHubUser);
                        } else {
                            response.getWriter().write("Error: Failed to create new GitHub user.");
                            return;
                        }
                    }

                    session.setAttribute("userType", "github");
                    response.sendRedirect("index.jsp");
                } else {
                    response.getWriter().write("Error: Failed to retrieve access token.");
                }
            } catch (IOException e) {
                e.printStackTrace();
                response.getWriter().write("Error: " + e.getMessage());
            }
        } else {
            response.getWriter().write("Error: No authorization code received.");
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void handleUserLogin(HttpServletRequest request, HttpServletResponse response, String githubID, String email, String name, String accessToken) throws IOException, SQLException {
        UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());

        if (githubID == null || githubID.isEmpty()) {
            response.getWriter().write("Error: Missing GithubID.");
            return;
        }

        GitHubUser existingUser = dao.loginGitHub(githubID);
        HttpSession session = request.getSession(true);

        if (existingUser != null) {
            session.setAttribute("userObj", existingUser);
        } else {
            User newUser = new User();
            newUser.setName(name);
            newUser.setEmail(email);
            dao.userRegister(newUser);
            int userID = dao.getLastInsertedUserID();

            GitHubUser newGitHubUser = new GitHubUser();
            newGitHubUser.setGithubID(githubID);
            newGitHubUser.setUserID(userID);
            newGitHubUser.setGHEmail(email);
            newGitHubUser.setGHName(name);
            newGitHubUser.setAuthToken(accessToken);

            if (dao.saveGitHubUser(newGitHubUser)) {
                session.setAttribute("userObj", newGitHubUser);
            } else {
                response.getWriter().write("Error: Failed to create new GitHub user.");
                return;
            }
        }

        session.setAttribute("userType", "github");
        response.sendRedirect("home.jsp");
    }

    private String getAccessToken(String code) throws IOException {
        URL url = new URL("https://github.com/login/oauth/access_token");
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);
        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
        conn.setRequestProperty("Accept", "application/json");

        String params = "code=" + URLEncoder.encode(code, "UTF-8")
                + "&client_id=" + URLEncoder.encode(CLIENT_ID, "UTF-8")
                + "&client_secret=" + URLEncoder.encode(CLIENT_SECRET, "UTF-8")
                + "&redirect_uri=" + URLEncoder.encode(REDIRECT_URI, "UTF-8");

        OutputStream os = conn.getOutputStream();
        os.write(params.getBytes("UTF-8"));
        os.flush();
        os.close();

        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        StringBuilder content = new StringBuilder();
        String inputLine;
        while ((inputLine = in.readLine()) != null) {
            content.append(inputLine);
        }
        in.close();
        return JsonParser.parseString(content.toString()).getAsJsonObject().get("access_token").getAsString();
    }

    private String getUserInfo(String accessToken) throws IOException {
        URL userUrl = new URL("https://api.github.com/user");
        HttpURLConnection userConn = (HttpURLConnection) userUrl.openConnection();
        userConn.setRequestMethod("GET");
        userConn.setRequestProperty("Authorization", "token " + accessToken);

        BufferedReader in = new BufferedReader(new InputStreamReader(userConn.getInputStream()));
        StringBuilder content = new StringBuilder();
        String inputLine;
        while ((inputLine = in.readLine()) != null) {
            content.append(inputLine);
        }
        in.close();
        return content.toString();
    }

    private String getPrimaryEmail(String accessToken) throws IOException {
        URL emailUrl = new URL("https://api.github.com/user/emails");
        HttpURLConnection emailConn = (HttpURLConnection) emailUrl.openConnection();
        emailConn.setRequestMethod("GET");
        emailConn.setRequestProperty("Authorization", "token " + accessToken);

        BufferedReader in = new BufferedReader(new InputStreamReader(emailConn.getInputStream()));
        StringBuilder content = new StringBuilder();
        String inputLine;
        while ((inputLine = in.readLine()) != null) {
            content.append(inputLine);
        }
        in.close();

        JsonArray emailArray = JsonParser.parseString(content.toString()).getAsJsonArray();
        for (JsonElement emailElement : emailArray) {
            JsonObject emailObj = emailElement.getAsJsonObject();
            if (emailObj.get("primary").getAsBoolean() && emailObj.get("verified").getAsBoolean()) {
                return emailObj.get("email").getAsString();
            }
        }
        return null;
    }
}
