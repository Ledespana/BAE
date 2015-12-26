$(document).ready(function() {
  $("#preview").click(function(event) {
    event.preventDefault();
    var input = $("input[name='message']").val()

    var score =  $.post(
            'https://apiv2.indico.io/sentimenthq?key=870c1d15ad6580f240481b820f8a884b',
            JSON.stringify({
              'data': input
            })
          ).then(function(res) {
              var score = JSON.parse(res).results;
              if (score >= 0.65){
                $('#sentiment').text( "Sentiment: Positive");
              } else if (score >= 0.25){
                $('#sentiment').text( "Sentiment: Neutral");
              }else {
                $('#sentiment').text( "Sentiment: Negative");
              };
          });
  });
});
