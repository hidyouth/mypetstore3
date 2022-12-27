$(function (){

     $('#cartNum').on('keyup',function (){
          var formData=$('#cartContent').serialize();

          $.ajax({
               type:'POST',
               url:'http://localhost:8080/MyPetStore/updateCart',
               data:formData,
               success:function (data){
                   var total_cost=data.substring(data.indexOf('[')+1,data.lastIndexOf(','));
                   var num=data.substring(data.indexOf(',')+1,data.lastIndexOf(']'));
                   $('#total_cost').text('$: '+total_cost);
                   $('#cart_num').text('num:'+num);
               },
               error:function (){

               }

          })

     })
})