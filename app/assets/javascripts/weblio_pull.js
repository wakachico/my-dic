function pull (){
  const submit = document.getElementById("weblio-link");
  
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    const errorElement = document.getElementById('pull-error');
    errorElement.innerText = "";
    const word_name = document.getElementById("word-name");
    const XHR = new XMLHttpRequest();
    XHR.open("GET", "/words/weblio_pull?name="+word_name.value, true);
    XHR.responseType = "json";
    XHR.send(null);
    XHR.onload = () => {
      const response = XHR.response;
      if (response.error) {
        errorElement.innerText = response.error;
      } else if (response.result) {
        const word_meaning = document.getElementById("word-meaning");
        const item = XHR.response.result;
        word_meaning.value = item;
      } else {
        errorElement.innerText = "※予期せぬエラーが発生しました。"
      };
    };
  });
};

window.addEventListener('load', pull);