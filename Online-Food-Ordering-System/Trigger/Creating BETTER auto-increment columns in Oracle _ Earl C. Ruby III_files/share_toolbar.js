/* Copyright (C) 2013-2014 Hupso.com */
var displayed=!1;if("undefined"===typeof hupso_background_t)var hupso_background_t="#EAF4FF";if("undefined"===typeof hupso_border_t)var hupso_border_t="#66CCFF";if("undefined"===typeof hupso_toolbar_size_t)var hupso_toolbar_size_t="big";if("undefined"===typeof hupso_twitter_via)var hupso_twitter_via="";if("undefined"===typeof hupso_image_folder_url)var hupso_image_folder_url="";var hupso_p=document.location.protocol,parent_width_out=0,parent_height_out=0; "function"!=typeof document.getElementsByClassName&&(document.getElementsByClassName=function(b){var c=document.getElementsByTagName("*"),a=[];for(i=0;i<c.length;i++)if(c[i].getAttribute("class"))for(ecl=c[i].getAttribute("class").split(" "),j=0;j<ecl.length;j++)ecl[j].toLowerCase()==b.toLowerCase()&&a.push(c[i]);else if(c[i].className)for(ecl=c[i].className.split(" "),j=0;j<ecl.length;j++)ecl[j].toLowerCase()==b.toLowerCase()&&a.push(c[i]);return a}); window.getComputedStyle||(window.getComputedStyle=function(b,c){this.el=b;this.getPropertyValue=function(a){"float"==a&&(a="styleFloat");var c=/(\-([a-z]){1})/g;c.test(a)&&(a=a.replace(c,function(a,b,c){return c.toUpperCase()}));return b.currentStyle[a]?b.currentStyle[a]:null};return this});var nodes=document.getElementsByClassName("hupso_toolbar"),count; for(count in nodes){var node=nodes[count];if("A"==node.nodeName){var img=node.firstChild;img.style.margin="0";img.style.border="0px";img.style.backgroundColor="transparent";img.style.outline="none";img.style.boxShadow="none";img.style.boxShadow="none";img.style.maxWidth="none";var newDiv=document.createElement("div");newDiv.id="hupso_toolbar_"+count;newDiv.className="hupso_c";newDiv.style.font.size="10px";var res=document.getElementById(newDiv.id);null==res&&node.parentNode.appendChild(newDiv);node.onclick= function(b){return!1};load_buttons(newDiv.id)}}function hupso_orig_pinterest(){var b=document.createElement("script");b.src=document.location.protocol+"//assets.pinterest.com/js/pinmarklet.js";document.getElementsByTagName("head")[0].appendChild(b)} function absoluteURL(b){var c=document.createElement("a"),a=document.getElementsByTagName("base")[0],g=a&&a.href,e=document.head||document.getElementsByTagName("head")[0],f=a||e.appendChild(document.createElement("base"));f.href="";c.href=b;b=c.href;a?a.href=g:e.removeChild(f);return b}function hupso_mailto(b){b=b.replace(/&/g,"%26");return b=b.replace(/"/g,"%22")} function load_buttons(b){var c="",c="undefined"===typeof hupso_url_t?document.URL:""==hupso_url_t?document.URL:hupso_url_t,a="",a="undefined"===typeof hupso_title_t?document.title:""==hupso_title_t?document.title:hupso_title_t,a=a.replace(/&quot;/g,'"'),g="",e="24px",f="24px";"big"==hupso_toolbar_size_t&&(g="32/",f=e="32px");"medium"==hupso_toolbar_size_t&&(g="24/",f=e="24px");"small"==hupso_toolbar_size_t&&(f=e="16px");var m="&title="+encodeURIComponent(a)+"&url="+encodeURIComponent(c),s=m+"&via="+ encodeURIComponent(hupso_twitter_via),n,k=""!=hupso_image_folder_url?hupso_image_folder_url:document.location.protocol+"//static.hupso.com/share/img/services/";n='target="_blank" '+('><img onmouseover="this.style.opacity=0.8;" onmouseout="this.style.opacity=1;" style="padding-right: 5px; padding-top: 5px; margin: 0; background-color:transparent; display:inline-block; border:0px; outline: none; width:'+e+"; height:"+f+'; box-shadow: none; max-width:none;" src="'+k);var p;p=' onclick="hupso_orig_pinterest();" '+ ('><img onmouseover="this.style.opacity=0.8;" onmouseout="this.style.opacity=1;" style="padding-right: 5px; padding-top: 5px; margin: 0; background-color:transparent; display:inline-block; border:0px; outline: none; width:'+e+"; height:"+f+'; box-shadow: none; max-width:none; " src="'+k);var q;q=' onclick="window.print();" '+('><img onmouseover="this.style.opacity=0.8;" onmouseout="this.style.opacity=1;" style="padding-right: 5px; padding-top: 5px; margin: 0; background-color:transparent; display:inline-block; border:0px; outline: none; width:'+ e+"; height:"+f+'; box-shadow: none; max-width:none; " src="'+k);f=" "+('><img onmouseover="this.style.opacity=0.8;" onmouseout="this.style.opacity=1;" style="padding-right: 5px; padding-top: 5px; margin: 0; background-color:transparent; display:inline-block; border:0px; outline: none; width:'+e+"; height:"+f+'; box-shadow: none; max-width:none; " src="'+k);e=document.getElementById(b);if(null!=e&&""==e.innerHTML){parent_width_out=e.parentNode.offsetWidth;parent_height_out=e.parentNode.offsetHeight; parent_width_out=100;var k=0,l="",r;for(r in hupso_services_t){var d=hupso_services_t[r].toString(),h="";if(!(3>d.length||30<d.length||-1!=d.indexOf("function")||-1!=d.indexOf("(")||-1!=d.indexOf("{")||-1!=d.indexOf("[")||"object"===typeof d)){h=d.toLowerCase();h=h.replace(" ","");new_url="Twitter"==d&&""!=hupso_twitter_via?s:m;switch(d){case "Pinterest":d='<a href="javascript:void(0)" '+p+g+h+'.png" title="'+d+'" /></a>';break;case "Print":d='<a href="javascript:void(0)" '+q+g+h+'.png" title="'+ d+'" /></a>';break;case "Email":d='<a href="mailto:?Subject='+hupso_mailto(a)+"&Body="+hupso_mailto(c)+'" '+f+g+h+'.png" title="'+d+'" /></a>';break;default:d='<a href="http://www.hupso.com/share/add.php?service='+h+new_url+'" '+n+g+h+'.png" title="'+d+'" /></a>'}k++;l+=d}}c=""+l;a=document.createElement("div");a.innerHTML=c;displayed=!0;a.id="toolbar_"+b;a.style.display="inline-block";null==document.getElementById(a.id)&&e.appendChild(a);"Microsoft Internet Explorer"==navigator.appName&&(null!=/MSIE ([0-9]{1,}[.0-9]{0,})/.exec(navigator.userAgent)&& (rv=parseFloat(RegExp.$1)),8==rv&&(document.getElementById(b),b="#"+b+" img { max-width: none; }",c=document.createElement("style"),c.type="text/css",c.styleSheet?c.styleSheet.cssText=b:c.appendChild(document.createTextNode(b)),document.getElementsByTagName("head")[0].appendChild(c)))}};