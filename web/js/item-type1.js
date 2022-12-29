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
                    $('button[value=yes]').attr('disabled',true)
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
                    $('button[value=yes]').attr('disabled',false);

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
    $('#orderform').submit(function (e){
        e.preventDefault();
        let $inputcheck = $('input[type=radio][name=address]:checked');
        let proname     = $('.product-name').text(),
            itmename    = $('.item-name').text(),
            totalprice  = $('.item-totalprice').text(),
            num         = $('.item-num').val(),
            address     = $inputcheck.data('province')+','+$inputcheck.data('city')+','+$inputcheck.data('district')+','+$inputcheck.data('address')+','+$inputcheck.data('name');
        let postData = 'productName='+proname+'&itemId='+itmename+'&totalprice='+totalprice+'&num='+num+'&address='+address;
        console.log(postData);
        $.ajax({
            type    :'POST',
            url     :'http://localhost:8080/MyPetStore_war_exploded/NewOrder',
            data    : postData,
            success :function (data){
                if(data === 'success'){
                    $('#overlay').hide();
                    alert('The order was successfully added');
                }
            },
            error   :function (errorMsg){
                console.log(errorMsg);
            }
        });
    });
    $('button[value=no]').click(function (){
        $('#overlay').hide();
    });
    $('#cart').click(function (){
        let itemid = $('input[type=radio][name=item]:checked').val();
        if(itemid === null ||itemid.length === 0){
            alert('please choose itemId!');
        }else{
            $.ajax({
                type    :'GET',
                url     :'http://localhost:8080/MyPetStore_war_exploded/addItemToCart?workingItemId='+itemid,
                success :function (data){
                    if(data === 'No Login'){
                        alert('You haven\'t logged in, please log in');
                        window.open('http://localhost:8080/MyPetStore_war_exploded/loginForm');
                    }else if(data === 'success'){
                        alert('The item was successfully added to the cart');
                    }else if(data === 'Exist'){
                        alert('The item already exists in the cart');
                    }
                },
                error   :function (errorMsg){
                    console.log(errorMsg);
                }

            })
        }
    });
})