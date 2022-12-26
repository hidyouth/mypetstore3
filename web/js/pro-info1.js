$(function (){
    $('.product-show').on('mouseenter',function (){
        let proname = $(this).find('.pro-name').attr('href');
        let productid = proname.substring(proname.indexOf('=',0)+1);
        console.log(productid);
        $.ajax({
            type    : 'GET',
            url     : 'http://localhost:8080/MyPetStore_war_exploded/ProductInfo?productId='+productid,
            success :function (data){
                console.log(data);
            },
            error   :function (errorMsg){
                console.log(errorMsg);
            }
        });
    });
});