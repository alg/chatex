$(function() {
  // new message form submission handler
  var form = $("form");
  form.on("submit", function(e) {
    e.preventDefault();

    var url  = form.attr('action'),
        body = $("#body"),
        user = $("#user");

    $.post(url, { message: { user: user.val(), body: body.val() } }, function(data) {
      body.val('').focus();
    });
  });

  // connection to the channel
  var socket = new Phoenix.Socket("/ws");
  socket.join("messages", $("#room_id").val(), {}, function(channel) {
    channel.on("new:message", function(data) {
      var div = $("<div class='alert alert-info'></div>").text(data.user + " said: " + data.body);
      $("#chatbox").append(div);
    });
  });
});
