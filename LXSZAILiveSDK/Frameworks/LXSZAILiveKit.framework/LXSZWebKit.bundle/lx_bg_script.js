window.addEventListener("load", async ()=>{
    webkit.messageHandlers.lx_backgroundListener.postMessage("Background webview - javascript loaded successfully");
});

document.addEventListener('DOMContentLoaded', function() {
    // 在这里你可以操作 localStorage
    var msg = 'localStorage is not available';
    try {
        localStorage.setItem('lx_test', 'lx_test_value_9527');
        localStorage.removeItem('lx_test');
        msg = 'localStorage is available';
        console.log(msg);
    } catch(e) {
        console.log(msg);
    }
    // 然后发送一个自定义的事件
    window.webkit.messageHandlers.lx_web_DOMContentLoaded.postMessage(msg);
});

function handleMessage(data) {
    window.console.log(data);
    webkit.messageHandlers.lx_backgroundListener.postMessage("Reply from background script : " + data);
    return "{'code':'0','msg':'success'}"
}

function lxSaveLocalStorageData() {
    var localStorageData = {};
    for (var i = 0; i < localStorage.length; i++) {
        var key = localStorage.key(i);
        localStorageData[key] = localStorage.getItem(key);
    }
    // 使用 btoa 进行 Base64 编码
    var base64String = btoa(unescape(encodeURIComponent(JSON.stringify(localStorageData))));
    return base64String;
}



function lxLoadLocalStorageData(base64String) {
    // 使用 atob 进行 Base64 解码
    try {
        var decodedData = decodeURIComponent(escape(atob(base64String)));
        var localStorageData = JSON.parse(decodedData);
        var keysArray = [];
        for (var key in localStorageData) {
            localStorage.setItem(key, localStorageData[key]);
            keysArray.push(key);
        }
        var keysString = keysArray.join(",");
        console.log("-----app localstore----- keys: " + keysString); // 打印 keysString
        webkit.messageHandlers.lx_backgroundListener.postMessage("Reply from localstore keys : " + keysString);
    } catch (error) {
        console.log("-----app localstore-----" + error);
    }
    return "{'code':'0','msg':'success'}"
}

