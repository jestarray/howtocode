/// call with slide_mode("black", "white"), for black bg and white text, although this may conflict with table coloring. In the future, it is better if we have a seperate toggle for dark mode independent of doing it here. All this function should do is grab all slide mode elements
function slide_mode(bg_color, color) {
  //if there isnt enough content for a slide and it looks to small, just zoom in! it also helps emphasizes the point
  let body = document.getElementsByTagName("body")[0];
  if (bg_color != undefined) {
    body.style.background = bg_color;
  }
  if (color != undefined) {
    body.style.color = color;
  }
  let all = document.getElementsByTagName("article")[0].children;
  Array.from(all).forEach((v) => {
    if (v.className !== "slide") {
      v.style.display = "none";
    }
  });
  let slide_points = Array.from(document.querySelectorAll(".slide"));
  let index = 0;

  function show_rev() {
    slide_points.forEach((v, index2) => {
      if (index2 !== index) {
        v.style.display = "none";
        v.style.background = "black";
      } else {
        v.style = "";
      }
    });
  }
  show_rev(); //initialize the slideshow by hiding everything
  window.onkeypress = (k) => {
    if (k.key.toLowerCase() === "a") {
      if (!(index - 1 < 0)) {
        index -= 1;
      }
    } else if (k.key.toLowerCase() === "d") {
      if (index + 1 < slide_points.length) {
        index += 1;
      }
    }
    show_rev();
  };
}
