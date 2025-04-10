// Colab的JS脚本
//主要实现过太久不动的检查，和时间到了之后，自动继续，然后重新运行

function pass1(){
    //先判断是否出现了谷歌验证码的那个框
    const googlecap = document.querySelector("body > colab-recaptcha-dialog").shadowRoot.querySelector("mwc-dialog > mwc-button");
    if(googlecap){//如果出现了.就点掉
        googlecap.click();
    }

    //再判断是不是出现了那个时间到了的框
    const isok = document.querySelector("#ok");
    if(isok){ //如果出现了时间到了，就点重新连接
        isok.click();
		//然后再运行
        //document.querySelector("#cell-oxSPQ5gxtsql > div.main-content > div.codecell-input-output > div.inputarea.horizontal.layout.code > div.cell-gutter > div > colab-run-button").shadowRoot.querySelector("div > div.cell-execution-indicator > iron-icon").click()
        //document.querySelector("#cell-hFq91eoctss7> div.main-content > div.codecell-input-output > div.inputarea.horizontal.layout.code > div.cell-gutter > div > colab-run-button").shadowRoot.querySelector("div").click()

    }

}
setInterval(pass1,20000);

