jQuery(document).on("turbolinks:load", function() {
  $(".order_index_tbody_tr").on('click', function() {
      window.location = $(this).data("href");
  });
});