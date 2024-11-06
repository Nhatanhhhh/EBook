/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.user.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.UUID;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.GoogleUser;
import com.entity.User;
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
public class GoogleUserServlet extends HttpServlet {

    private static final String CLIENT_ID = GOOGLE_CLIENT_ID;
    private static final String CLIENT_SECRET = GOOGLE_CLIENT_SECRET;
    private static final String REDIRECT_URI = GOOGLE_REDIRECT_URI;

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
            out.println("<title>Servlet GoogleUserServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GoogleUserServlet at " + request.getContextPath() + "</h1>");
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
                    String googleID = userJson.get("id").getAsString();
                    String email = userJson.get("email").getAsString();
                    String name = userJson.get("name").getAsString();

                    UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
                    GoogleUser existingUser = dao.loginGoogle(googleID);
                    HttpSession session = request.getSession(true);

                    if (existingUser != null) {
                        session.setAttribute("userObj", existingUser);
                    } else {
                        // T?o m?i ng??i d�ng v� ch�n v�o c? b?ng User v� GoogleUser
                        User newUser = new User();
                        newUser.setName(name);
                        newUser.setEmail(email);

                        GoogleUser newGoogleUser = new GoogleUser();
                        newGoogleUser.setGoogleID(googleID);
                        newGoogleUser.setGGEmail(email);
                        newGoogleUser.setGGName(name);
                        newGoogleUser.setAuthToken(accessToken);
                        newGoogleUser.setPassword(UUID.randomUUID().toString());

                        if (dao.registerGoogleUser(newUser, newGoogleUser)) {
                            session.setAttribute("userObj", newGoogleUser);
                        } else {
                            response.getWriter().write("Error: Failed to create new Google user.");
                            return;
                        }
                    }

                    session.setAttribute("userType", "google");
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
        processRequest(request, response);
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

    private String getAccessToken(String code) throws IOException {
        URL url = new URL("https://oauth2.googleapis.com/token");
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);
        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");

        String params = "code=" + URLEncoder.encode(code, "UTF-8")
                + "&client_id=" + URLEncoder.encode(CLIENT_ID, "UTF-8")
                + "&client_secret=" + URLEncoder.encode(CLIENT_SECRET, "UTF-8")
                + "&redirect_uri=" + URLEncoder.encode(REDIRECT_URI, "UTF-8")
                + "&grant_type=authorization_code";

        OutputStream os = conn.getOutputStream();
        os.write(params.getBytes("UTF-8"));
        os.flush();
        os.close();

        int responseCode = conn.getResponseCode();
        BufferedReader in = new BufferedReader(new InputStreamReader(responseCode >= 200 && responseCode < 300 ? conn.getInputStream() : conn.getErrorStream()));
        StringBuilder content = new StringBuilder();
        String inputLine;
        while ((inputLine = in.readLine()) != null) {
            content.append(inputLine);
        }
        in.close();
        conn.disconnect();

        if (responseCode >= 200 && responseCode < 300) {
            JsonObject jsonObject = JsonParser.parseString(content.toString()).getAsJsonObject();
            return jsonObject.get("access_token").getAsString();
        } else {
            throw new IOException("Failed to get access token: " + content.toString());
        }
    }

    private String getUserInfo(String accessToken) throws IOException {
        URL url = new URL("https://www.googleapis.com/oauth2/v2/userinfo?access_token=" + URLEncoder.encode(accessToken, "UTF-8"));
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");

        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        StringBuilder content = new StringBuilder();
        String inputLine;
        while ((inputLine = in.readLine()) != null) {
            content.append(inputLine);
        }
        in.close();
        conn.disconnect();

        return content.toString();
    }

}
