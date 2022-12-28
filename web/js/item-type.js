$(function (){
    let iteminfo;
    $('input[type=radio][name=item]').change(function (){
        let type = $(this).val();
        $.ajax({
            type    :'GET',
            url     :'http://localhost:8080/MyPetStore_war_exploded/ItemTypeChange?type='+type,
            success :function (data){
                console.log(data);
                iteminfo = data;
                let price = data.listPrice;
                $('.price').text('$'+price);
            },
            error   :function (errorMsg){
                console.log(errorMsg);
            }
        })
    });
    $('#order').click(function (){
        $('.product-name').text(iteminfo.product.name)
        $('.item-name').text(iteminfo.itemId);
        $('.item-price').text(iteminfo.listPrice);
        $('.item-totalprice').text(iteminfo.listPrice*($('.item-num').val()));
        $.ajax({
            type    :'GET',
            url     :'http://localhost:8080/MyPetStore_war_exploded/GetAddess',
            success :function (data){
                console.log(data);
                if(data === 'No Login'){
                    let HTML = 'You haven\'t logged in, please <a href="loginForm">log in</a>';
                    $('.user-address').html(HTML);
                }else{
                    let HTML = '';
                    for(let i=0,j=data.length;i<j;i++){
                        HTML += '<input type="radio" name="address" data-province=\"'+data[i].province+'\"';
                        HTML +=' data-city=\"'+data[i].city+'\"';
                        HTML +=' data-district=\"'+data[i].district+'\"';
                        HTML +=' data-address=\"'+data[i].address+'\"';
                        HTML +=' data-name=\"'+data[i].name+'\"';
                        HTML += '>'
                        HTML += data[i].province+' '+data[i].city+' '+data[i].district+' '+data[i].address+' '+data[i].name;
                    }
                    $('.user-address').html(HTML);

                }
            },
            error   :function (errorMsg){
                console.log(errorMsg);
            }
        })
        $('#overlay').show();
    });
    $('.item-num').change(function (){
        let val = $(this).val(),price = $('.item-price').text();
        $('.item-totalprice').text(val * price);
    });
    $('button[value=yes]').click(function (){

    });
    $('button[value=no]').click(function (){
        $('#overlay').hide();
    });
})