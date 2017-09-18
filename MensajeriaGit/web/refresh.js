function refreshdiv(UsuarioO,UsuarioD){
        var cadena = "UsuarioO="+UsuarioO+"&UsuarioD="+UsuarioD;
        var seconds = 1; // intervalo de actualizar div
        var divid = "Mensajes"; // el div que quieres actualizar!
        var url = "ventanaChat.jsp";// el archivo de proceso php

                 
                     var xmlHttp;
                     try{
                         xmlHttp=new XMLHttpRequest(); // Firefox, Opera 8.0+, Safari
                     }
                     catch (e){
                         try{
                             xmlHttp=new ActiveXObject("Msxml2.XMLHTTP"); // Internet Explorer
                         }
                         catch (e){
                             try{
                                 xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
                             }
                             catch (e){
                                 alert("Tu explorador no soporta AJAX.");
                                 return false;
                             }
                         }
                     }
                     var timestamp = parseInt(new Date().getTime().toString().substring(0,10));
                     
                     var nocacheurl = url + "?t=" + timestamp; 
                     
                     // The code...

                     xmlHttp.onreadystatechange=function(){
                         if(xmlHttp.readyState === 4 && xmlHttp.readyState !== null){
                             document.getElementById(divid).innerHTML=xmlHttp.responseText;
			     var arr = document.getElementsByTagName('script');
			     for (var n = 0; n < arr.length; n++)
				 eval(arr[n].innerHTML);//run script inside div
                             var timer = setTimeout(function(){refreshdiv(UsuarioO,UsuarioD)},seconds*1000);
                         }
                     }
                     xmlHttp.open("GET",nocacheurl + "&" + cadena,true);
                     xmlHttp.send(null);
                    return timer;
                }