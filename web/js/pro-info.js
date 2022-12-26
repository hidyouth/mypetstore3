$(function (){
    $('.product-show').on('mouseenter',function (){
        let proname = $(this).find('.pro-name').text();
        $.ajax({
            type    : 'GET',
            url     : 'http://localhost:8080/MyPetStore_war_exploded/ProductInfo?productId='+ proname,
            success :function (data){
                console.log(data);
            },
            error   :function (errorMsg){
                console.log(errorMsg);
            }
        });
    });
});