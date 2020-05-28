$(function() {
  /***
   * The smLib object is going to store all my functions and data, so as to
   *   avoid polluting the global namespace. This first line checks to see if
   *   there IS an smLib already -- if so, we'll leave it be and stick our
   *   libraries within it.
   ***/
  window.smLib = window.smLib || {};
  /***
   * The smLib.forms object is a form elements library. By doing this, I can 
   *   later use a different system to create the DOM elements, and it will
   *   be transparent to anything I build on it. What this means is, I can
   *   swap in the backbone library or a pure-javascript solution or whatever,
   *   and I can set different options here that will be used globally. The
   *   advantages to the jQuery library are that it's easy, and the clone()
   *   function makes all of these reusable all over.
   ***/ 
  smLib.forms = smLib.forms || {
    anchorEl: $("<a>"),
    buttonEl: $("<input>").prop("type", "button"),
    checkboxEl: $("<input>").prop("type", "checkbox"),
    radioEl: $("<input>").prop("type", "radio"),
    textEl: $("<input>").prop("type", "text"),
    textareaEl: $("<textarea>"),
    fieldsetEl: $("<fieldset>"),
    labelEl: $("<label>"),
    spanEl: $("<span>"),
    divEl: $("<div>")
  };
  /***
   * The smLib.icons object is an icon library. This is done primarily to make
   *   the creation of icon objects consistent across whatever app uses it.
   *   Functionally, the same structure as the smLib.forms object, but this
   *   uses the Bootstrap Glyphicon set. It is by no means comprehensive, but
   *   the beauty of this approach is that, if you need more icons, you can
   *   add them here and use them anywhere. 
   ***/
  smLib.icons = smLib.icons || {
    addEl: smLib.forms.spanEl.clone().prop({
      "class": "glyphicon glyphicon-plus"
    }),
    removeEl: smLib.forms.spanEl.clone().prop({
      "class": "glyphicon glyphicon-minus"
    })
  };
  
  /***
   * The smLib.surveyForms object is what handles all the survey form processes
   *   this includes creating the new question, adding the various answer
   *   types, toggling between the different answer types, and handling the
   *   preview pane of the new question.
   ***/

  smLib.surveyForms = smLib.surveyForms || {

    /***
     * function addQuestion(container)
     *    Used to create a question collection within the container. The
     *    question collection contains the question, the answer set (which in
     *    turn contains the answer option toggle and the actual answers), the
     *    preview pane and the question controls.
     ***/
    addQuestion: function(container) {
      var that = this;
      this.container = container;
      var i = this.container.find(".question-container").length + 1;

      // First we create the question element, simply a text input wrapped in a label.
      var newQuestionEl = smLib.forms.textEl.clone().prop({
        "name": "q" + i,
        "id": "q" + i,
        "class": "form-control"
      }).on("keyup", function(){
          that.updatePreview(newQuestion, newAnswerEl, previewContainerEl); 
        });
      // This div is used to contain the actual question within the total 
      //  question-container div.
      var newQuestion = smLib.forms.divEl.clone().prop({
        "class": "question-pane"
      }).append("Question #"+i+": ", newQuestionEl);

      // Next, we create an array of options to determine what type of question this is:
      //  radio, checkbox or text.
      var newQTypeArr = [];
      var newQTypeRadioEl = smLib.forms.radioEl.clone().prop({
        name: "qType" + i,
        id: "qType" + i,
        value: "radio",
        class: "choices radiobox"
      }).on("click", function() {
        smLib.surveyForms.showOptionsPane(radioOptions);
      });
      newQTypeArr[0] = smLib.forms.labelEl.clone().append(newQTypeRadioEl, " Radio");

      var newQTypeCheckEl = smLib.forms.radioEl.clone().prop({
        name: "qType" + i,
        id: "qType" + i,
        value: "checkbox",
        class: "choices radiobox"
      }).on("click", function() {
        smLib.surveyForms.showOptionsPane(checkboxOptions);
      });
      newQTypeArr[1] = smLib.forms.labelEl.clone().append(newQTypeCheckEl, "Checkbox");

      var newQTypeTextEl = smLib.forms.radioEl.clone().prop({
        name: "qType" + i,
        id: "qType" + i,
        value: "text",
        class: "choices radiobox"
      }).on("click", function() {
        smLib.surveyForms.showOptionsPane(textOptions);
      });
      newQTypeArr[2] = smLib.forms.labelEl.clone().append(newQTypeTextEl, "Text");

      // The following are the three answer option panels. The first two include
      //  an "add choices" button as well as an initial answer option. The text
      //  box option, by its nature, uses only a single input -- no need for more.
      
      var addRadioChoiceButton = smLib.forms.buttonEl.clone().prop({
        "class": "btn btn-primary add-radio-choice answer-option",
        "value": "Add Radio button"
      }).append(smLib.icons.addEl.clone(), "Add choices").on("click", function() {
        that.addRadioOptions(radioOptions);
      });
      
      var radioOptions = smLib.forms.divEl.clone().prop({
        class: "radio-answer-options"
      }).data("control-type", "radio").append(addRadioChoiceButton).on("change", function(){
        that.updatePreview(newQuestion, newAnswerEl, previewContainerEl); 
      }).hide();
      this.addRadioOptions(radioOptions);

      var addCheckboxChoiceButton = smLib.forms.buttonEl.clone().prop({
        "class": "btn btn-primary add-checkbox-choice answer-option",
        "value": "Add Checkbox"
      }).append(smLib.icons.addEl.clone(), "Add choices").on("click", function() {
        that.addCheckboxOptions(checkboxOptions);
      });
      var checkboxOptions = smLib.forms.divEl.clone().prop({
        class: "checkbox-answer-options"
      }).append(addCheckboxChoiceButton).on("change", function(){
        that.updatePreview(newQuestion, newAnswerEl, previewContainerEl); 
      }).data("control-type", "checkbox").hide();
      this.addCheckboxOptions(checkboxOptions);

      var textOptions = smLib.forms.divEl.clone().prop({
        class: "text-answer-options"
      }).on("change", function(){
        that.updatePreview(newQuestion, newAnswerEl, previewContainerEl); 
      }).data("control-type", "text").hide();
      this.addTextOptions(textOptions);

      // Now we create the answer options pane. containing this separately from the
      //  answers will allow them to be manipulated as needed.
      var newAnswerEl = smLib.forms.divEl.clone().prop({
        class: "answer-options-pane"
      }).append(radioOptions, checkboxOptions, textOptions);

      // Just as we wrapped the question in a label, we're going to wrap the answer options
      //   in an answer pane. This is where all of the answer work will happen.
      var newAnswer = smLib.forms.divEl.clone().prop({
        class: "answer-pane"
      }).append(newQTypeArr, newAnswerEl);
      
      /***
       * The preview pane will be hidden initially, but any change to the above
       *   will automagically update the preview pane, which contains a question
       *   and answer div. Note that only the currently displayed answer option
       *   will appear in the preview pane.
       ***/
      var previewQuestion = smLib.forms.divEl.clone().prop({
        class: "preview-question"
      });
      var previewAnswer = smLib.forms.divEl.clone().prop({
        class: "preview-answer"
      })
      var previewContainerEl = smLib.forms.divEl.clone().prop({
        class: "preview-pane"
      }).on("click", function(){
        that.togglePreview(previewContainerEl);
      }).append(previewQuestion, previewAnswer).hide()
      
      /***
       * The last component of the "question collection" is the controls, allowing
       *   save or delete of this question. At this point, save simply toggles
       *   the visibility of the preview pane vs the Q&A panes, and the delete
       *   completely removes the question collection.
       ***/
      var saveButton = smLib.forms.buttonEl.clone().prop({
        value: "Save question"
      }).on("click", function(){
        that.togglePreview(previewContainerEl);
      });
      var deleteButton = smLib.forms.buttonEl.clone().prop({
        value: "Remove queston"
      }).on("click", function(){
        if(confirm("Are you sure you want to remove this question? Action cannot be undone.") ){
          newQContainerEl.remove();
        }
      })
      var questionControls = smLib.forms.divEl.clone().prop({
        class: "controls-pane"
      }).append(saveButton, deleteButton);

      // The question container pane will contain four sub-panes: 
      //   - question
      //   - answer
      //   -preview (hidden by default)
      //   -controls
      //   The whole point of this is to create a logical structure for the entire question,
      //   making it a discrete logical piece.
      var newQContainerEl = smLib.forms.divEl.clone().prop({
        class: "question-container",
      }).append(newQuestion, newAnswer, previewContainerEl, questionControls);
      
      // Remember the container? Now that we've created this DOM structure, we
      //  stick it into the question container. It is a completely self-contained
      //  structure, and its listeners only listen to their own element -- so we
      //  don't need to worry about tracking which element is being edited or
      //  deleted, the DOM elements themselves listen for it.
      this.container.append(newQContainerEl);

    }, //end addQuestion()
    addRadioOptions: function(radioPane) {
      /***
       * Another DOM element creation function. This creates the radio
       *   button text option, and if it's the first, a button to add
       *   more options. 
       ***/

      // We want to get the length of the current choices, 
      //  as this will give us an index for the new option

      var radioChoice = radioPane.find(".radio-choice");
      var choice_c = radioChoice.length;

      var radioTempEl = smLib.forms.radioEl.clone().prop({
        "class": "answer-option radio-choice"
      });

      var radioChoiceTextEl = smLib.forms.textEl.clone().prop({
        "class": "form-control answer-option radio-choice radiochoice"+choice_c,
        "name": "radiochoice" + choice_c,
      });

      var radioChoiceEl = smLib.forms.labelEl.clone().append(radioTempEl, radioChoiceTextEl);
      // Make sure to add the new text element BEFORE the 
      //    add more button.
      radioPane.find(".add-radio-choice").before(radioChoiceEl);
    },
    addTextOptions: function(textPane) {
      this.textPane = textPane;

      var textChoiceTextEl = smLib.forms.textEl.clone().prop({
        "class": "form-control answer-option text-choice",
        "name": "text-placeholder",
      });

      var textChoiceEl = smLib.forms.labelEl.clone().append("Placeholder text: ", textChoiceTextEl);
      textPane.append(textChoiceEl);
    },
    addCheckboxOptions: function(checkboxPane) {
      // We want to get the length of the current choices, 
      //  as this will give us an index for the new option

      var checkboxChoice = checkboxPane.find(".checkbox-choice");
      var choice_c = checkboxChoice.length;

      var checkboxTempEl = smLib.forms.checkboxEl.clone().prop({
        "class": "answer-option checkbox-choice"
      });
      var checkboxChoiceTextEl = smLib.forms.textEl.clone().prop({
        "class": "form-control answer-option checkbox-choice checkboxchoice"+choice_c,
        "name": "checkboxchoice" + choice_c,
      });

      var checkboxChoiceEl = smLib.forms.labelEl.clone().append(checkboxTempEl, checkboxChoiceTextEl);
      // Make sure to add the new text element BEFORE the 
      //    add more button.
      checkboxPane.find(".add-checkbox-choice").before(checkboxChoiceEl);
    },
    showOptionsPane: function(optionsPane) {
      // This is what toggles the various options panes within the answer panel
      //  All it does is, if the given pane is hidden, show it, then hide its
      //  sibling panes. THat was the reason for the oddly nested structure:
      //  as the options panes are the ONLY siblings within their container, we
      //  can do this. 
      if (optionsPane.not(":visible")) optionsPane.slideDown().siblings().slideUp();
    },
    updatePreview: function(questionPane, answerPane, previewPane){
      // Every time any part of the question is changed, this will be called
      //  to update the preview pane element.
      
      var previewQuestion = previewPane.find(".preview-question").empty();
      var previewAnswer = previewPane.find(".preview-answer").empty();
      
      var question = questionPane.text() + questionPane.find("input[type='text']").val();
      var answerOption = answerPane.find(":visible");
      var answers = answerOption.find("input[type='text']" );

      previewQuestion.text(question);

      switch(answerOption.data("control-type") ){
        case "radio":
          answers.each(function(){
            var labelText = $(this).val();
            var rbEl = smLib.forms.radioEl.clone();
            var answerLabelEl = smLib.forms.labelEl.clone()
                               .append(rbEl, labelText );
            previewAnswer.append(answerLabelEl);
          });
          break;
        case "checkbox":
          answers.each(function(){
            var cbEl = smLib.forms.checkboxEl.clone();
            var answerLabelEl = smLib.forms.labelEl.clone()
                               .append(cbEl, $(this).val() );
            previewAnswer.append(answerLabelEl);
          });
          break;
          previewAnswer.append(textblockEl);
        case "text":
          answers.each(function(){
            var textblockEl = smLib.forms.textEl.clone().attr({
              placeholder: $(this).val()
            });
          });
          break;
        }
    },
    togglePreview: function(previewPane){
      // This is what displays the preview versus the editable elements.
      
      if(previewPane.is(":visible") ) {
        previewPane.hide().siblings().show();
      } else {
        previewPane.show().siblings().hide();
      }
    }
  };
});