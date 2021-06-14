function checkValue() {
    if (!document.SignInfo.userSex.value) {
        alert("성별을 선택하세요.");
        return false;
    }
    if (!document.SignInfo.userName.value) {
        alert("이름을 입력하세요.");
        return false;
    }
    if (!document.SignInfo.userNickName.value) {
        alert("닉네임을 입력하세요.");
        return false;
    }
    if (!document.SignInfo.userID.value) {
        alert("아이디를 입력하세요.");
        return false;
    }
    if (!document.SignInfo.userPassword.value) {
        alert("비밀번호를 입력하세요.");
        return false;
    }
    if (!document.SignInfo.userEmail.value) {
        alert("이메일을 입력하세요.");
        return false;
    }
    if (!document.SignInfo.userAge.value) {
        alert("출생일을 입력하세요.");
        return false;
    }
    if (!document.SignInfo.agreeCheck.checked) {
        alert("동의에 체크하세요.");
        return false;
    }
};

function maxLengthCheck(object) {
    if (object.value.length > object.maxLength) {
        object.value = object.value.slice(0, object.maxLength);
    }
};

function koreanCheck() {
    if (!(event.keyCode < 47 && event.keyCode > 58)) event.returnValue = false;
};

$(document).on("keyup", "input[engAndNumOnly]", function() { $(this).val($(this).val().replace(/[^a-zA-Z0-9]/gi, "")); })

$('#userEmail').blur(function() {
    var email_rule = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
    var mail =$("#userEmail").val();

    if (!email_rule.test(mail)) {
        alert(mail);
        alert("이메일을 형식에 맞게 입력해주세요.");
        $("#submit").attr("disabled", "disabled");
        return false;
    }else{
        $("#submit").removeAttr("disabled");
    }
});

function checkPassword(){
    var userPassword = document.getElementById("userPassword").value;
    if(userPassword.length<6 || userPassword.length>16){
        document.getElementById("checkPassword").innerHTML = "6글자 이상, 16글자 이하만 사용가능.";
        document.getElementById("checkPassword").style.color='red';
        document.getElementById("userPassword").value = "";

    }else{
        if(document.getElementById("checkPassword").style.color=='red'){
            document.getElementById("checkPassword").style.color='blue';
        }

    }
    $("#submit").attr("disabled", "disabled");
    if(document.getElementById('userPassword').value !='' && document.getElementById('checkUserPassword').value!=''){
        if(document.getElementById('userPassword').value==document.getElementById('checkUserPassword').value){
            document.getElementById('checkPassword').innerHTML='비밀번호가 일치합니다.'
            document.getElementById('checkPassword').style.color='blue';
            $("#submit").removeAttr("disabled");
        }
        else{
            document.getElementById('checkPassword').innerHTML='비밀번호가 일치하지 않습니다.';
            document.getElementById('checkPassword').style.color='red';
            document.getElementById('checkUserPassword').value = "";
            $("#submit").attr("disabled", "disabled");
        }
    }
}
function email_change(){
    var emailSelected = $("#emailSelected option:selected").val();
    if(emailSelected == "직접입력"){
        $('#email').attr("readonly",false);
        $('#email').val('');
        $('#email').focus();
    } else{
        $('#email').attr("readonly",true);
        $("#email").val(emailSelected);
    }
    if(emailSelected == "선택하세요"){
        $('#email').attr("readonly",true);
        $('#email').val('');
    }
}
$(document).ready(function(){
    $('#showPassword').on('click',function(){
        $('input').toggleClass('active');
        if($('input').hasClass('active')){
            $(this).attr('class',"fa fa-fw fa-eye-slash field-icon mt-3")
                .prev('input').attr('type',"text");
        }else{
            $(this).attr('class',"fa fa-fw fa-eye field-icon mt-3")
                .prev('input').attr('type','password');
        }
    });
    $('#showCheckPassword').on('click',function(){
        $('input').toggleClass('active');
        if($('input').hasClass('active')){
            $(this).attr('class',"fa fa-fw fa-eye-slash field-icon mt-1")
                .prev('input').attr('type',"text");
        }else{
            $(this).attr('class',"fa fa-fw fa-eye field-icon mt-1")
                .prev('input').attr('type','password');
        }
    });
    $('#password-field').on('click',function(){
        $('input').toggleClass('active');
        if($('input').hasClass('active')){
            $(this).attr('class',"fa fa-fw fa-eye-slash field-icon")
                .prev('label').prev('input').attr('type',"text");
        }else{
            $(this).attr('class',"fa fa-fw fa-eye field-icon")
                .prev('label').prev('input').attr('type','password');
        }
    });
});