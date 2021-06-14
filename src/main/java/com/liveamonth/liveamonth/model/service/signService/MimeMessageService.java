package com.liveamonth.liveamonth.model.service.signService;

import com.liveamonth.liveamonth.entity.vo.OneToOneAskVO;
import com.liveamonth.liveamonth.entity.vo.UserVO;
import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.activation.FileDataSource;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import static com.liveamonth.liveamonth.constants.EntityConstants.SITE_URL;

@Service
public class MimeMessageService implements SendMailService {
    @Autowired
    private JavaMailSender mailSender;

    @Override
    public void sendPasswordByMail(UserVO userVO) {
        MimeMessage message = mailSender.createMimeMessage();
        try {
            MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
            messageHelper.setSubject("[한달살기에서 알려드립니다]고객님의 임시 비밀번호가 발급되었습니다.");
            String htmlContent = "<img src=\"https://liveamonth-resources.s3.ap-northeast-2.amazonaws.com/img/logo/logo.png\"><br><br>"
                    +"안녕하세요. "+userVO.getUserName()+" 고객님<br><br>"
                    + "<h4>요청하신 임시 비밀번호는 다음과 같습니다.<br>"
                    + "임시비밀번호 : " + userVO.getUserPassword()+"<br>"
                    + "<a href=\"" + SITE_URL + "signIn\">로그인 하러가기</a></h4><br>"
                    + "<p>발급된 비밀번호는 임시로 발급된 것이므로 로그인 후 '마이페이지 -> 회원정보 수정'을 통해 비밀번호를 변경해주시기 바랍니다.</p><br>"
                    + "<p>다른 문의사항이 있으시면 한달살기(TP.liveamonth@gamil.com)으로 문의해 주시기 바랍니다.</p><br>"
                    + "<strong>감사합니다.</strong>";
            messageHelper.setText(htmlContent,true);
            messageHelper.setFrom("TP.liveamonth@gmail.com","한달살기");
            messageHelper.setTo(new InternetAddress(userVO.getUserEmail(),userVO.getUserName(), "UTF-8"));
            mailSender.send(message);
        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void sendOneToOneAskByMail(OneToOneAskVO oneToOneAskVO, UserVO userVO) {
        MimeMessage message = mailSender.createMimeMessage();
        try {
            MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
            messageHelper.setSubject("[한달살기에서 알려드립니다]고객님의 1:1 문의 답변이 완료되었습니다.");
            String htmlContent = "<img src=\"https://liveamonth-resources.s3.ap-northeast-2.amazonaws.com/img/logo/logo.png\"><br><br>"
                    +"안녕하세요. "+userVO.getUserName()+" 고객님<br><br>"
                    + "<h4>1:1 문의 답변이 완료되었습니다.<br><br>"
                    + "문의 날짜 : " + oneToOneAskVO.getOneToOneAskDate()+"<br>"
                    + "문의 내용 : " + oneToOneAskVO.getOneToOneAskDesc()+"<br><br>"
                    + "답변 내용 : " + oneToOneAskVO.getOneToOneAskReply()+"<br></h4><br>"
                    + "<p>다른 문의사항이 있으시면 한달살기(TP.liveamonth@gamil.com)으로 문의해 주시기 바랍니다.</p><br>"
                    + "<strong>감사합니다.</strong>";
            messageHelper.setText(htmlContent,true);
            messageHelper.setFrom("TP.liveamonth@gmail.com","한달살기");
            messageHelper.setTo(new InternetAddress(oneToOneAskVO.getOneToOneAskUserEmail(),userVO.getUserName(), "UTF-8"));
            mailSender.send(message);
        }catch (Exception e) {
            e.printStackTrace();
        }
    }
}
