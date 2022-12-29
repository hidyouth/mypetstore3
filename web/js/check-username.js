
$(function(){
    $('button[type=submit]').attr('disabled',true);
    function checkregister(username){
        if(username ===null || username ===''|| username.length ===0){
            return '用户名不能为空';
        }
        else{
            return '';
        }
    }
    $('input[name=username]').on('blur',function(){
        var username = $(this).val(),
            $this = $(this);
        var validateMsg = checkregister(username);
        if(validateMsg === ''){
            $('#feedback').text('');
            $.ajax({
                type      :  'GET',
                url       :  'http://localhost:8080/MyPetStore_war_exploded/CheckRegister?username='+username,
                success   :  function(data){
                    if( data === 'Exist'){
                        $('#feedback').text('用户名已存在');
                        $('button[type=submit]').attr('disabled',true);
                    }else if(data === 'Not Exist'){
                        $('#feedback').text('');
                        $('button[type=submit]').attr('disabled',false);

                    }
                },
                error : function(errorMsg){
                    console.log(errorMsg);
                }
            });
        }else{
            $('#feedback').text(validateMsg);
            $('button[type=submit]').attr('disabled',true);
        }
    });
    $('input[name=repeatpassword]').on('blur',function (){
       let repeatpassword = $(this).val(),
            password = $('input[name=password]').val();
       if(password === null || password.length === 0 || password ==='' ){
           $('#feedback').text('密码不能为空');
       }else{
           if(password !== repeatpassword){
               $('#feedback').text('重复密码与密码不符');
               $('button[type=submit]').attr('disabled',true);
           }else {
               $('#feedback').text('');
               $('button[type=submit]').attr('disabled',false);
           }
       }
    });
    $('input[name=email]').on('blur',function (){
       let email = $(this).val();
       if(email === '' || email === null || email.length === 0){
           $('#feedback').text('请输入邮箱');
           $('button[type=submit]').attr('disabled',true);
       }else {
           $('#feedback').text('');
           $('button[type=submit]').attr('disabled',false);
       }
    });
    $('input[name=phone]').on('blur',function (){
        let email = $(this).val();
        if(email === '' || email === null || email.length === 0){
            $('#feedback').text('请输入电话');
            $('button[type=submit]').attr('disabled',true);
        }else {
            $('#feedback').text('');
            $('button[type=submit]').attr('disabled',false);
        }
    });
});