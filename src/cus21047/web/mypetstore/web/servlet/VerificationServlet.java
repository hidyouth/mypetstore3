package cus21047.web.mypetstore.web.servlet;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

public class VerificationServlet extends HttpServlet {
    private static final String LOGIN_FORM = "/WEB-INF/jsp/account/login.jsp";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //设置验证码的长度和宽度
        int height=50;
        int width=100;
        //建立img输入流
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        //建立画笔对象
        Graphics2D g = image.createGraphics();
        //设置底部颜色
        g.setColor(Color.PINK);
        g.fillRect(0,0,width,height);
        //设置边框颜色
        g.setColor(Color.BLUE);
        g.drawRect(0,0,width-1,height-1);
        //绘画验证码的码,通过设置随机数从中抽取索引来实现随机组合形成验证码
        g.setColor(Color.green);
        String str="QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm123456789";
        Random ran=new Random();
        //设置字体格式Font中的参数分别为字体格式,字体风格,字体大小
        Font f =new Font("楷体",Font.PLAIN,40);
        g.setFont(f);
        //设置字符串流来存储随机验证码用来以后的验证
        StringBuilder sb = new StringBuilder();
        for (int i = 1; i <= 4; i++) {
            int index =ran.nextInt(str.length());
            char ch=str.charAt(index);
            sb.append(ch);
            g.drawString(ch+"",width/5*i-10,height/2+10);
        }
        String check_session=sb.toString();
        //在请求中存储验证码数据
        req.getSession().setAttribute("check_session",check_session);
        //画几条干扰线
        g.setColor(Color.GRAY);
        for (int i = 1; i <=5 ; i++) {
            int x1= ran.nextInt(width);
            int x2=ran.nextInt(width);
            int y1=ran.nextInt(height);
            int y2=ran.nextInt(height);
            g.drawLine(x1,y1,x2,y2);
        }
        //将图片形成,放在response中以备后续使用,在此servlet中就形成了一张图片
        //其他的页面就可以通过设置图片路径为当前servlet就可以使用该验证码
        ImageIO.write(image,"jpg",resp.getOutputStream());
    }

    String createCode() {
        String Code="";
        char[] codeList = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
                'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
        for(int i=0;i<5;i++){
            int charNum = (int)(Math.random()*62);
            Code+=codeList[charNum];
        }
        return Code;
    }
}

