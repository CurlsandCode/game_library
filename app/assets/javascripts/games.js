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

var pic = {
  id: 1,
  caption: "Fallout power armor",
  game_id: 1,
  created_at: "2017-07-22T18:07:52.618Z",
  updated_at: "2017-07-22T18:07:52.618Z",
  picture_file_name: "fallout.jpg",
  picture_content_type: "image/jpeg",
  picture_file_size: 2090434,
  picture_updated_at: "2017-07-22T18:07:51.401Z",
  avatar_url: "/system/screenshots/pictures/000/000/001/original/fallout.jpg?1500746871",
  med_url: "/system/screenshots/pictures/000/000/001/medium/fallout.jpg?1500746871"
}

function renderPartial(){
  document.querySelector('div#screenshot-box').innerHTML = `<div class="col-12 text-center"><h2 class= "game-title text-center">SCREENSHOTS</h2></div>`
  // jax request

  var gamePic = new GamePic(pic.id, pic.game_id, pic.med_url);
  gamePic.render();
}
