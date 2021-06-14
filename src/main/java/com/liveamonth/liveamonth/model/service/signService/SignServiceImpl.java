package com.liveamonth.liveamonth.model.service.signService;

import com.liveamonth.liveamonth.entity.vo.UserVO;
import com.liveamonth.liveamonth.model.mapper.signMapper.SignMapper;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import static com.liveamonth.liveamonth.constants.EntityConstants.EUser.USER_ID;
import static com.liveamonth.liveamonth.constants.EntityConstants.EUser.USER_PASSWORD;


@Service
public class SignServiceImpl implements SignService {
	@Autowired
	private SendMailService sendMailService;

    @Autowired
    private SignMapper signMapper;

    @Override
    public String checkID(String userID) throws Exception {
        return signMapper.checkID(userID);
    }

    @Override
    public String checkNickName(String userNickName) throws Exception {
        return signMapper.checkNickName(userNickName);
    }

    @Override
    public void insertUser(UserVO userVO) throws Exception {
        signMapper.insertUser(userVO);
    }

    @Override
    public UserVO checkSign(String userID, String userPassword) throws Exception {
        HashMap<String, Object> hash = new HashMap<String, Object>();
        hash.put(USER_ID.getText(), userID);
        hash.put(USER_PASSWORD.getText(), userPassword);
        UserVO userVO = signMapper.checkSign(hash);
        return userVO;
    }


    @Override
    public String findID(String userName, String userEmail) throws Exception {
        String foundUserID = signMapper.findID(userName, userEmail);
        if(foundUserID !=null) return foundUserID;
        else return null;
    }


  @Override 
  public boolean findPW(String userID, String userName, String userEmail) throws Exception {
      String foundState = signMapper.findPW(userID, userName, userEmail);
      if(foundState == null) return false;
      else{
          String pw = "";
          for (int i = 0; i < 8; i++) {
              pw += (char) ((Math.random() * 26) + 97);
          }
          UserVO userVO = signMapper.searchUserById(userID);
          userVO.setUserPassword(pw);
          sendMailService.sendPasswordByMail(userVO);
          signMapper.updatePW(userID, pw);
          return true;
      }
	}

    @Override
    public String checkEmail(String userEmail) throws Exception {
        return signMapper.checkEmail(userEmail);
    }

    @Override
    public UserVO setTokenInfo(String access_token) throws Exception {
        UserVO naverUserVO = new UserVO();

        String header = "Bearer " + access_token;
        String apiurl = "https://openapi.naver.com/v1/nid/me";
        URL url = new URL(apiurl);
        HttpURLConnection con = (HttpURLConnection)url.openConnection();
        con.setRequestMethod("GET");
        con.setRequestProperty("Authorization", header);
        int responseCode = con.getResponseCode();
        BufferedReader br;
        StringBuffer res = new StringBuffer();

        if(responseCode==200) { // 정상 호출
            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String inputLine;

            while ((inputLine = br.readLine()) != null) {
                res.append(inputLine);
            }

            JSONParser parsing = new JSONParser();
            Object obj = parsing.parse(res.toString());
            JSONObject jsonObj = (JSONObject)obj;
            JSONObject resObj = (JSONObject)jsonObj.get("response");

            String naverID = (String)resObj.get("id");
            String email = (String)resObj.get("email");
            String name = (String)resObj.get("name");
            String stringGender = (String)resObj.get("gender");
            String birthyear = (String)resObj.get("birthyear");
            String nickname = (String)resObj.get("nickname");
            Boolean gender;

            //성별 선택 안한 경우
            if(stringGender != null && !"null".equals(stringGender)){
                if(stringGender.equals("M")){
                    gender = false;
                }else{
                    gender = true;
                }
            }else{
                gender = null;
            }

            naverUserVO.setUserID(naverID);
            naverUserVO.setUserNickname(nickname);
            naverUserVO.setUserEmail(email);
            naverUserVO.setUserName(name);
            naverUserVO.setUserSex(gender);
            // 나이 선택 안하면 null이므로 0값 넣어주기
            if(birthyear == null){
                naverUserVO.setUserAge(0);
            }else{
                naverUserVO.setUserAge(Integer.parseInt(birthyear));
            }
            } else {  // 에러 발생
                 br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
        br.close();
        return naverUserVO;
    }

    @Override
    public String checkNaverID(String naverID) throws Exception {
        return this.signMapper.checkNaverID(naverID);
    }

    @Override
    public int setNewNaverMember(UserVO newNaverUser) throws Exception {
        return this.signMapper.setNewNaverMember(newNaverUser);
    }

    @Override
    public void updateNaverUser(UserVO userVO) throws Exception {
        this.signMapper.updateNaverUser(userVO);
    }

    @Override
    public UserVO getNaverUser(String naverID) throws Exception {
        return this.signMapper.getNaverUser(naverID);
    }

}
