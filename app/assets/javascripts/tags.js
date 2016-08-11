// $(function() {
//   $('#search-button').on('click', function(event) {
//     event.preventDefault();
//     var tagname = $('#hashtag').val();
//
//     var access_token = ''
//
//     var request_url = 'https://api.instagram.com/v1/tags/%7B' + tagname + '%7D/media/recent?access_token=' + access_token;
//     $.ajax({
//       url: request_url,
//       method: 'GET',
//       dataType: 'json',
//       data: { }
//     }).done(function() {
//       console.log('success');
//     }).fail(function() {
//       console.log('error');
//     }).always(function() {
//       console.log('sent request to instagram');
//     });
//   });
// });
