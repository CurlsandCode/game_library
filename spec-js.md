# Specifications for the Rails with jQuery Assessment

Specs:
- [x] Use jQuery for implementing new requirements(game.js handles implementing jQuery for requirements)

- [x] Include a show resource rendered using jQuery and an Active Model Serialization JSON backend.(renderScreenShot handles retrieving and rendering screenshot to DOM along with a next button to view next image via jQuery/AJAX)

- [x] Include an index resource rendered using jQuery and an Active Model Serialization JSON backend.(both renderComments and renderPartial handle rendering the index of a resource to DOM)

- [x] Include at least one has_many relationship in information rendered via JSON and appended to the DOM.(both renderComments and renderPartial append a has_many relationship resource to DOM)

- [x] Use your Rails API and a form to create a resource and render the response without a page refresh. (commentSubmission handle comment submission and then renders to DOM)

- [x] Translate JSON responses into js model objects. (GamePic and ScreenPic take response and translate to js model objects)

- [x] At least one of the js model objects must have at least one method added by your code to the prototype. (Both GamePic and ScreenPic have render methods to append response to DOM)

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
