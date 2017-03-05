function init_script() {
  autoform();
  multi_carousel();
  foto_cocoon();
  fancybox();
  datepicker();
  chosen();
  infinite_scroll();
}

if (typeof Turbolinks != 'undefined') {
  $(document).on("page:change", function () {
    init_script();
  });
  $(document).on("page:load", function () {
    init_script();
  });
} else {
  $(document).ready(function () {
    init_script();
  });
  $(document).on("page:load", function () {
    init_script();
  });
}
