
$(document).ready(function() {
  if(document.getElementById("interactions_form")!=null){

    var sentencefields = document.querySelectorAll(".sentence_interaction");
    var setenceExplanation = document.querySelectorAll(".sentence_explanation");
    var keywordExplanation = document.querySelectorAll(".keyword_explanation");
    var comboExplanation = document.querySelectorAll(".combo_explanation");

    var secondKeyword = document.querySelectorAll(".second_keyword");
    var combo = document.querySelectorAll(".combo");

    sentencefields[0].classList.remove("hidden");
    setenceExplanation[0].classList.remove("hidden");
    keywordExplanation[0].classList.add("hidden");
    keywordExplanation[1].classList.add("hidden");
    comboExplanation[0].classList.add("hidden");

    $.each(combo, function( index, value ) {
      value.classList.add("hidden");
    });
    $('#interaction_category').on('change', function() {

      if( $(this).val() == "Sentence" ){
        sentencefields[0].classList.remove("hidden");
        setenceExplanation[0].classList.remove("hidden");
        keywordExplanation[0].classList.add("hidden");
        comboExplanation[0].classList.add("hidden");
        keywordExplanation[1].classList.add("hidden");


        $.each(combo, function( index, value ) {
          value.classList.add("hidden");
        });

      }else if( $(this).val() == "Combo" ){
        sentencefields[0].classList.add("hidden");
        setenceExplanation[0].classList.add("hidden");
        keywordExplanation[0].classList.add("hidden");
        comboExplanation[0].classList.remove("hidden");
        keywordExplanation[1].classList.remove("hidden");



        $.each(combo, function( index, value ) {
          value.classList.remove("hidden");
        });
      }else if( $(this).val() == "Keyword" ){
        setenceExplanation[0].classList.add("hidden");
        keywordExplanation[0].classList.remove("hidden");
        comboExplanation[0].classList.add("hidden");
        keywordExplanation[1].classList.remove("hidden");



        sentencefields[0].classList.add("hidden");
        $.each(combo, function( index, value ) {
          value.classList.remove("hidden");
        });
        secondKeyword[0].classList.add("hidden");
      }
    });
  };
});
