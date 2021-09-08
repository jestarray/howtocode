function slide_mode() {
  //if there isnt enough content for a slide and it looks to small, just zoom in! it also helps emphasizes the point
  let body = document.getElementsByTagName("body")[0];
  body.style.background = "black";
  body.style.color = "white";
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
