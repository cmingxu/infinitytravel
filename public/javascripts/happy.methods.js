var happy = {
  USPhone: function (val) {
    return /^\(?(\d{3})\)?[\- ]?\d{3}[\- ]?\d{4}$/.test(val);
  },
  
  // matches mm/dd/yyyy (requires leading 0's (which may be a bit silly, what do you think?)
  date: function (val) {
    return /^(?:0[1-9]|1[0-2])\/(?:0[1-9]|[12][0-9]|3[01])\/(?:\d{4})/.test(val);
  },
  email: function (val) {
    if(/^(?:\w+\.?)*\w+@(?:\w+\.)+\w+$/.test(val)){
      if($('#user_email_unhappy').size()==0){
        $("#user_email").after('<span id="user_email_unhappy" class="unhappyMessage"><i class="icon-spinner icon-spin"></i>&nbsp;Checking...</span>');
      }
      else{
        $("#user_email_unhappy").html('<i class="icon-spinner icon-spin"></i>&nbsp;Checking...')
      }
      $.ajax({
        type: "post",
        url:"/welcome/checkemail/",
        data: { email: $("#user_email").val()},
        error:function(){$("#user_email_unhappy").removeClass("happyMessage").addClass("unhappyMessage").html('<i class="icon-remove"></i>&nbsp;Server Error, Please try again later. ')},
        success:function(result){
          if(result=='false'){
            $("#user_email_unhappy").replaceWith("<span id='user_email_unhappy' class='unhappyMessage'><i class='icon-remove'></i>&nbsp;This Email has been resisted!!</span>");
          }
          else{
            $("#user_email_unhappy").replaceWith("<span id='user_email_unhappy' class='happyMessage'><i class='icon-ok'></i></span>");
          }
        }
      });
      return true;
    }
    else{
      $('#user_email_unhappy').remove();
      return false;
    }
  },
  
  minLength: function (val, length) {
    return val.length >= length;
  },
  
  maxLength: function (val, length) {
    return val.length <= length;
  },
  
  equal: function (val1, val2) {
    return (val1 == val2);
  },

  nickname: function(val){
    $('#user_username_unhappy').remove();
    if(/^\w+$/.test(val)&&val.length>=3){
      $('#user_username').after("<span id='user_username_unhappy' class='unhappyMessage'><i class='icon-spinner icon-spin'></i>&nbsp;Checking...</span>");
      $.ajax ( {
        type: "post",
        url:"/welcome/checkusername/",
        data: { username: $("#user_username").val()},
        error:function(){$("#user_username_unhappy").removeClass("happyMessage").addClass("unhappyMessage").html("<i class='icon-remove'></i>&nbsp;Server Error, Please try again later. ")},
        success:function(result){
        if(result=='false'){
          $("#user_username_unhappy").replaceWith("<span id='user_username_unhappy' class='unhappyMessage'><i class='icon-remove'></i>&nbsp;Username has beed taken.</span>");
          return false;
        }
        else{
          $("#user_username_unhappy").replaceWith("<span id='user_username_unhappy' class='happyMessage'><i class='icon-ok'></i></span>");
          return true;
        }
        }})
      return true;
    }
    else{
      $('#user_username').after("<span id='user_username_unhappy' class='unhappyMessage'><i class='icon-remove'></i>&nbsp;Username is too short.</span>");
      return true;
    }
  },
  password: function(val){//password校验: 输入与否 强度校验
    if($('#passwordval').size()==0){$("#user_password").after("<span id='passwordval' class='warnMessage'></span>")}
    if(val.length<6){
      $('#passwordval').text("Password is too short.");
      return true;
    }else if(val.length>40){
      $('#passwordval').text("Password is too long.");
      return true;
    }else{
      $('#passwordval').removeClass("unhappyMessage").addClass("happyMessage").html('<i class="icon-ok"></i>');
      return true;
    }
  },
  password_confirmation: function(val){
    if($('#passwordcval').size()==0){$("#user_password_confirmation").after("<span id='passwordcval' class='warnMessage'></span>")}
    if(val==$('#user_password').val()){
      $('#passwordcval').removeClass("unhappyMessage").addClass("happyMessage").html('<i class="icon-ok"></i>');
      return true;
    }
    else{
      $('#passwordcval').removeClass("happyMessage").addClass("unhappyMessage").text("Two passwords does not match.");
      return true;
    }
  },
};