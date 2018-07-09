
function Overchange(tar)
{
    

    if(document.getElementById(tar.id).value=="已关注")
    {   
        // alert(tar.id);

        document.getElementById(tar.id).value="取消关注";
                    var a = document.getElementById(tar.id);
                    a.style.background='rgba(47,166,183,1)';                    
    }
else
{
                    document.getElementById(tar.id).value="＋关注";
                    var a = document.getElementById(tar.id);
                    a.style.background='rgba(7,166,83,1)';    
}
    };





function Outchange(tar)
{
    if(document.getElementById(tar.id).value=="取消关注")
    {
        document.getElementById(tar.id).value="已关注";
        var a = document.getElementById(tar.id);
        a.style.background='rgba(7,166,83,1)';
    }else
    {   

    if(document.getElementById(tar.id).value=="已关注")
    {
        document.getElementById(tar.id).value="已关注"
    }else 
        {

                    var a = document.getElementById(tar.id);
                    a.style.background='rgba(47,166,183,1)'; 

        }
    }

    };


function Clikchange(tar)
{
    if(document.getElementById(tar.id).value=="＋关注")
    {
        
        document.getElementById(tar.id).value="已关注"
                    var a = document.getElementById(tar.id);
                    a.style.background='rgba(7,166,83,1)';                  
    }
else
{
    if(document.getElementById(tar.id).value=="已关注")
    {
        document.getElementById(tar.id).value="已关注"
                    var a = document.getElementById(tar.id);
                    a.style.background='rgba(7,166,83,1)';                  
    }else               
    document.getElementById(tar.id).value="＋关注"

}
    };


// 判断数组中包含element元素
         Array.prototype.contains = function (element) {
         
            for (var i = 0; i < this.length; i++) {
                if (this[i] == element) {
                    return true;
                }
            }
            return false;
        }
    
        window.onload = function() {
            var oDiv1 = document.getElementById('div1');
            var oDiv2 = document.getElementById('div2');
            var oDiv3 = document.getElementById('div3');
            var oDiv4 = document.getElementById('div4');
            var oDiv5 = document.getElementById('div5');
            var oDiv6 = document.getElementById('div6');
            
            // document.onclick = function(e) {
            //     if( !oDiv1.contains(e.target)) {
            //         oDiv2.style.display = "none";
            //         oDiv4.style.display = "none";
            //         oDiv6.style.display = "none";
            //     }


            // }
            // oDiv1.onmouseover = function() {//这是是div1
            //     oDiv2.style.display = "block";
            // }

            // oDiv1.onmouseout = function(){
            //     oDiv2.style.display = "none";

            // }

            // oDiv3.onmouseover = function(){//这是是div3
            //     oDiv4.style.display = "block";
            // }
            // oDiv3.onmouseout = function(){
            //     oDiv4.style.display = "none";
            // }

            // oDiv5.onmouseover = function(){//这是是div5
            //     oDiv6.style.display = "block";
            // }
            // oDiv5.onmouseout = function(){
            //     oDiv6.style.display = "none";
            // }           



        };