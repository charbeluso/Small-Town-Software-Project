$(document).ready(function() {
  // Handle the user clicking on "Add a question"
  $("#addq").click(function() {
    // a nested function creates the HTML DOM structure.
    smLib.surveyForms.addQuestion( $("#questions") );
  });
});


