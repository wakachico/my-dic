// function pos (){

//   const pullDownButton = document.getElementById("pos");
//   const pullDownParents = document.getElementById("pull-down");
//   const pullDownChild = document.querySelectorAll(".pull-down-list");

//   pullDownButton.addEventListener('click', function() {
//     if (pullDownParents.getAttribute("style") == "display:block;") {
//       pullDownParents.removeAttribute("style", "display:block;");
//     } else {
//       pullDownParents.setAttribute("style", "display:block;");
//     }
//   });
//   pullDownChild.forEach(function(list) {
//     list.addEventListener('click', function() {
//       console.log(list);
//     });
//   })
// };

// window.addEventListener('load', pos);