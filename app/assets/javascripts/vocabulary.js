$(document).ready(function() {

  $("#r1").click(function() {
    var sentencesTable = document.querySelectorAll('#sentences');
    var keywordsTable = document.querySelectorAll('#keywords');
    var comboTable = document.querySelectorAll('#combo');
    var addVocabulary = document.querySelectorAll('#add');

    sentencesTable[0].classList.remove('hidden');
    keywordsTable[0].classList.add('hidden');
    comboTable[0].classList.add('hidden');
    addVocabulary[0].classList.add('hidden');
  });

  $("#r2").click(function() {
    var sentencesTable = document.querySelectorAll('#sentences');
    var keywordsTable = document.querySelectorAll('#keywords');
    var comboTable = document.querySelectorAll('#combo');
    var addVocabulary = document.querySelectorAll('#add');

    sentencesTable[0].classList.add('hidden');
    keywordsTable[0].classList.remove('hidden');
    comboTable[0].classList.add('hidden');
    addVocabulary[0].classList.add('hidden');
  });

  $("#r3").click(function() {
    var sentencesTable = document.querySelectorAll('#sentences');
    var keywordsTable = document.querySelectorAll('#keywords');
    var comboTable = document.querySelectorAll('#combo');
    var addVocabulary = document.querySelectorAll('#add');

    sentencesTable[0].classList.add('hidden');
    keywordsTable[0].classList.add('hidden');
    comboTable[0].classList.remove('hidden');
    addVocabulary[0].classList.add('hidden');

  });
});
