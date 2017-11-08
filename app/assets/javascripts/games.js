$(document).ready(function(){
  renderPartial();
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


function renderPartial(){
  document.querySelector('div#screenshot-box').innerHTML = `<div class="col-12 text-center"><h2 class= "game-title text-center">SCREENSHOTS</h2></div>`
  // Ajax request
  $.get("/user_screenshots.json", function(data) {
    data.forEach(function(screenshot) {
      var newPic = new GamePic(screenshot.id, screenshot.game_id, screenshot.med_url)
      newPic.render();
    })
  })
}
