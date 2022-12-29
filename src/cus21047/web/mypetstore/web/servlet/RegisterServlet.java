package cus21047.web.mypetstore.web.servlet;

import cus21047.web.mypetstore.domain.Account;
import cus21047.web.mypetstore.service.AccountService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RegisterServlet extends HttpServlet {
    AccountService accountService = new AccountService();

    private static final String REGISTER_FORM = "/WEB-INF/jsp/account/register.jsp";
    private static final String LOGIN_FORM = "/WEB-INF/jsp/account/login.jsp";
    private String username;
    private String password;
    private String email;
    private String firstName;
    private String lastName;
    private String repeatpassword;
    private String status;
    private String address1;
    private String address2;
    private String city;
    private String state;
    private String zip;
    private String country;
    private String phone;
    private String favouriteCategoryId;
    private String languagePreference;
    private boolean listOption;
    private boolean bannerOption;
    private String bannerName;
    private String registerMsg;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.username = req.getParameter("username");
        this.password = req.getParameter("password");
        this.repeatpassword = req.getParameter("repeatpassword");
        this.email = req.getParameter("email");
        this.phone = req.getParameter("phone");




                Account registerUser =  new Account();
                registerUser.setUsername(this.username);
                registerUser.setPassword(this.password);
                registerUser.setEmail(this.email);
                registerUser.setFirstName(this.firstName);
                registerUser.setLastName(this.lastName);
                registerUser.setStatus(this.status);
                registerUser.setAddress1(this.address1);
                registerUser.setAddress2(this.address2);
                registerUser.setCity(this.city);
                registerUser.setState(this.state);
                registerUser.setZip(this.zip);
                registerUser.setCountry(this.country);
                registerUser.setPhone(this.phone);
                accountService.insterAccount(registerUser);
                accountService.insterSingon(registerUser);
                req.getRequestDispatcher(LOGIN_FORM).forward(req,resp);

    }
    private boolean validate(){
        if(this.username == null ||this.username.equals("")){
            this.registerMsg = "�û�������Ϊ��";
            return false;
        }
        if(this.password == null ||this.password.equals("")){
            this.registerMsg = "���벻��Ϊ��";
            return false;
        }
        if(this.repeatpassword == null ||this.repeatpassword.equals("")){
            this.registerMsg = "���벻��Ϊ��";
            return false;
        }
        if(!this.repeatpassword.equals(this.password)){
            this.registerMsg = "�������벻һ��";
            return false;
        }
        if(email == null||this.email.equals("")){
            this.registerMsg="���䲻��Ϊ��";
            return false;
        }
        if(this.firstName == null ||this.firstName.equals("")){
            this.registerMsg = "�ղ���Ϊ��";
            return false;
        }
        if(this.lastName == null ||this.lastName.equals("")){
            this.registerMsg = "������Ϊ��";
            return false;
        }
        if(this.address1 == null ||this.address1.equals("")){
            this.registerMsg = "��ַ1����Ϊ��";
            return false;
        }
        if(this.address2 == null ||this.address2.equals("")){
            this.registerMsg = "��ַ2����Ϊ��";
            return false;
        }
        if(this.zip == null ||this.zip.equals("")){
            this.registerMsg = "�������벻��Ϊ��";
            return false;
        }
        if(this.status == null ||this.status.equals("")){
            this.registerMsg = "ְҵ����Ϊ��";
            return false;
        }
        if(this.country == null ||this.country.equals("")){
            this.registerMsg = "���Ҳ���Ϊ��";
            return false;
        }
        if(this.city == null ||this.city.equals("")){
            this.registerMsg = "���в���Ϊ��";
            return false;
        }
        if(this.state == null ||this.state.equals("")){
            this.registerMsg = "�ݲ���Ϊ��";
            return false;
        }
        if(this.phone == null ||this.phone.equals("")){
            this.registerMsg = "�绰����Ϊ��";
            return false;
        }

        return true;
    }
}
