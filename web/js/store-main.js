window.onload = function(){
    console.log('aaa');
    var content = this.document.getElementsByClassName('content')[0];

    var li = content.getElementsByTagName('li');

    function fun(i,j){
        li[i].style.opacity = 1;
        li[j].style.opacity = 0;

        li[i+5].style.backgroundColor = '#ffffff';

        li[j+5].style.backgroundColor = '#00000000';
    }
    fun(0,1);
    var i = 0;
    function auto(){
        i++;
        if(i>=5){
            i=0;
            fun(0,2);
        }else{
            fun(i,i-1);
        }
    }

    timer = this.setInterval(auto,2000);
    content.onmouseover = function(){
        clearInterval(timer);
    }
    content.onmouseout = function(){
        timer = setInterval(auto,2000)
    }
    var j = 0;
    for(;j < 5; j++){
        li[j + 5].index = j;
        li[j + 5].onclick = function(){
            fun(this.index,i);
            i= this.index;
        }
    }
}