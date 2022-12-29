$(function (){

    $('input[id=cartNum]').on('keyup',function (){
        var formData=$(this).parent('#cartContent').serialize(),
            $this = $(this);

        $.ajax({
            type:'POST',
            url:'http://localhost:8080/MyPetStore_war_exploded/updateCart',
            data:formData,
            success:function (data){
                var total_cost=data.substring(data.indexOf('[')+1,data.lastIndexOf(','));
                var num=data.substring(data.indexOf(',')+1,data.lastIndexOf(']'));
                $this.parent('#cartContent').siblings('#total_cost').text('$: '+total_cost);
                $this.parent('#cartContent').siblings('#cart_num').text('num:'+num);
            },
            error:function (){

            }

        });

    });
    $('button[id=order]').click(function (){
        let num = $(this).siblings('#cartContent').children('#cartNum').val(),
            itemanme = $(this).siblings('#itemname').text(),
            productname = $(this).siblings('#productname').text(),
            totalprice = $(this).siblings('#total_cost').data('totalcost'),
            listprice = totalprice/num;
        $('.product-name').text(productname)
        $('.item-name').text(itemanme);
        $('.item-price').text(listprice);
        $('.item-totalprice').text(totalprice);
        $('.item-num').val(num);
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
        });
        $('#overlay').show();
    });
    $('.item-num').change(function (){
        let val = $(this).val(),price = $('.item-price').text();
        $('.item-totalprice').text(val * price);
    });
    $('#orderform').submit(function (e){
        e.preventDefault();
        let $inputcheck = $('input[type=radio][name=address]:checked');
        if($inputcheck.length === 0){
            alert('please choose address');
        }else{
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
            $.ajax({
                type    :'GET',
                url     :'http://localhost:8080/MyPetStore_war_exploded/removeCartItem?workingItemId='+itmename,
                success :function (data){
                    if(data === 'success'){
                        window.location.reload();
                    }
                },
                error   :function (errorMsg){

                }
            });
        }
    });
    $('button[value=no]').click(function (){
        $('#overlay').hide();
    });
    $('#remove').click(function (){
        let itemname = $(this).siblings('#itemname').text();
        $.ajax({
            type    :'GET',
            url     :'http://localhost:8080/MyPetStore_war_exploded/removeCartItem?workingItemId='+itemname,
            success :function (data){
                if(data === 'success'){
                    window.location.reload();
                }
            },
            error   :function (errorMsg){

            }
        });
        }
    );
});