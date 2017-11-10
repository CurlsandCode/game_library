$(document).ready(function(){
  renderPartial();
  renderScreenShot();
  renderComments();
  commentSubmission();
  $.rails.enableFormElements($($.rails.formSubmitSelector));
})

class GamePic {
  constructor(id, game_id, med_url){
    this.id = id
    this.game_id = game_id
    this.med_url = med_url
  }

  render(){
    document.querySelector('div#screenshot-box').innerHTML += `<a href="/games/${this.game_id}/screenshots/${this.id}"><span id="${this.id}" class="this-pic"><img  src="${this.med_url}" class="img-fluid"></span></a>`
  }
}

function renderScreenShot() {
    $("#js-next").on("click", function(e) {
      // e.preventDefault();
      var nextId = $(this).data("pic");
      var gameId = $(this).data("game");

      $.get("/games/" + gameId + "/screenshots.json", function(data) {
        let nextImg = data.filter(image => image.id > nextId)[0];

        $("#the-pic").html("<img src=" + nextImg["avatar_url"] + " class='img-fluid' >");
        $(".pic-caption").text(nextImg["caption"]);
        $("#js-next").data("pic", nextImg["id"]);
        $("#js-next").data("game", gameId);

      });
    });
}


function renderPartial(){
    if (document.querySelector('div#screenshot-box')) {

      document.querySelector('div#screenshot-box').innerHTML = `<div class="col-12 text-center"><h2 class= "game-title text-center">SCREENSHOTS</h2></div>`

      $.get("/user_screenshots.json", function(data) {
        data.forEach(function(screenshot) {
          var newPic = new GamePic(screenshot.id, screenshot.game_id, screenshot.med_url)
          newPic.render();
        })
      })

    }
}

function renderComments() {

  if (document.querySelector('div#game-comments')) {

    var gameId = $("#game-comments").attr("data-game")
    $.get("/games/" + gameId + "/comments.json", function(data) {
      data.forEach(function(comment) {
        $("#comment-box").append("<li class='col-12 comment-box'>" + comment["content"] + "</li>")
      })
    })
  }

}

function commentSubmission() {
  $("#new_comment").on("submit", function(event) {
    event.preventDefault();

    $.ajax({
      url: $(this).attr('action'),
      method: 'POST',
      data: $(this).serialize(),
      success: function(response) {
        $("#comment_content").val("");
        $("#comment-box").append(response);
      }
    })
  })
}
