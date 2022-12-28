$(function (){
    $('.product-show').on('mouseenter',function (){
        let proname = $(this).find('.pro-name').attr('href');
        let productid = proname.substring(proname.indexOf('=',0)+1),
            productname = $(this).find('.pro-name').text(),
            $div = $(this);
        console.log(productid);
        $.ajax({
            type    : 'GET',
            url     : 'http://localhost:8080/MyPetStore_war_exploded/ProductInfo?productId='+productid,
            success :function (data){
                console.log(data);

                let productinfoHTML = '';
                productinfoHTML += '<div class=\"product-info\">'
                productinfoHTML += '<div>';
                productinfoHTML += '<h1>' +productname + '</h1>';
                for(let i=0,j=data.length;i<j;i++){
                    productinfoHTML +='<p>'+data[i].itemId +':$'+data[i].listPrice+'</p>';
                }
                productinfoHTML +='</div>';
                productinfoHTML += '</div>'
                let $html = $(productinfoHTML);
                $div.after($html);
                $('.product-info').show();


            },
            error   :function (errorMsg){
                console.log(errorMsg);
            }
        });
    });
    $('.product-show').on('mouseleave',function (){
        $('.product-info').remove();
    })
});