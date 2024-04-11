$(function () {
    $("img.lazy").lazyload();
});
function showContent() {
    var content = document.getElementById("content");
    content.classList.remove("hidden");
}
function toggleContent() {
    var content = document.getElementById("content");
    var toggleBtn = document.getElementById("toggleBtn");
    
    if (content.classList.contains("hidden")) {
        content.classList.remove("hidden");
        toggleBtn.innerHTML = "点击收起详细内容";
    } else {
        content.classList.add("hidden");
        toggleBtn.innerHTML = "点击显示详细内容";
    }
}

window.onload = function() {
    const styleTitle1 = "font-size: 22px;font-weight: 600;color: rgb(51,204,255);";
    const styleTitle2 = "font-size: 12px;color: rgb(51,51,204);";
    const styleContent = "color: rgb(30,152,255);";
    const title1 = "mxd's EPG";
    const title2 = `                                                                                        
                                                8I                                   dPYb     
                                                8I                                  IP  Yb    
                                                8I                                  I8  8I    
                                                8I                                  I8  8     
       gggg  gggg         gg     gg     gggg 8I  gg     gg    ggg       gggg gg  I8 dPgg   
      8   8P   8      d8  8b dP     dP    Y8I  I8     8I  i8   8i   dP    Y8I  I8dP   8I 
     I8   8I   8I    dP    88      i8      8I  I8     8I  I8   8I  i8      8I  I8P    I8 
     dP   8I   Yb        dP Y8     d8     d8b  d8b   d8I   YbadP   d8     d8b  d8     I8 
    8P    8I    Y88    dP     Y88P  Y8888P  Y8P Y88P 888888P Y888P Y8888P  Y888P     8Y8
                                                        d8I                                 
                                                      dP 8I                                 
                                                     8   8I                                 
                                                    I8   8I                                 
                                                     8   8I                                 
                                                      Y8P                                   `;
    const content = `\n\n版本:V2.1-20240330 \n主页:https://www.mxdyeah.top/ \nGithub:https://github.com/mxdabc/epg`;
    console.info(`%c${title1} %c${title2} %c${content}`, styleTitle1, styleTitle2, styleContent);
    
    // 获取当前页面的URL
    var currentUrl = window.location.href;
    
    // 使用正则表达式来匹配https://epg.mxdyeah.top/
    if (!currentUrl.startsWith('https://epg.mxdyeah.top/')) 
    {
      // 如果不匹配，显示一个弹窗
      alert("因域名备案原因，现迁移域名至https://epg.mxdyeah.top/，该域名将在5月1日停用");
    }
}