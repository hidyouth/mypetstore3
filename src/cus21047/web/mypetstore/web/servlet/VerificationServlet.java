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

        //������֤��ĳ��ȺͿ��
        int height=50;
        int width=100;
        //����img������
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        //�������ʶ���
        Graphics2D g = image.createGraphics();
        //���õײ���ɫ
        g.setColor(Color.PINK);
        g.fillRect(0,0,width,height);
        //���ñ߿���ɫ
        g.setColor(Color.BLUE);
        g.drawRect(0,0,width-1,height-1);
        //�滭��֤�����,ͨ��������������г�ȡ������ʵ���������γ���֤��
        g.setColor(Color.green);
        String str="QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm123456789";
        Random ran=new Random();
        //���������ʽFont�еĲ����ֱ�Ϊ�����ʽ,������,�����С
        Font f =new Font("����",Font.PLAIN,40);
        g.setFont(f);
        //�����ַ��������洢�����֤�������Ժ����֤
        StringBuilder sb = new StringBuilder();
        for (int i = 1; i <= 4; i++) {
            int index =ran.nextInt(str.length());
            char ch=str.charAt(index);
            sb.append(ch);
            g.drawString(ch+"",width/5*i-10,height/2+10);
        }
        String check_session=sb.toString();
        //�������д洢��֤������
        req.getSession().setAttribute("check_session",check_session);
        //������������
        g.setColor(Color.GRAY);
        for (int i = 1; i <=5 ; i++) {
            int x1= ran.nextInt(width);
            int x2=ran.nextInt(width);
            int y1=ran.nextInt(height);
            int y2=ran.nextInt(height);
            g.drawLine(x1,y1,x2,y2);
        }
        //��ͼƬ�γ�,����response���Ա�����ʹ��,�ڴ�servlet�о��γ���һ��ͼƬ
        //������ҳ��Ϳ���ͨ������ͼƬ·��Ϊ��ǰservlet�Ϳ���ʹ�ø���֤��
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

