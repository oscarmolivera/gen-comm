$(document).ready(function () {
  $('#tablaCategorias').DataTable({
       "iDisplayLength": 5,
       "lengthMenu": [[5, 10, 15, 20, 25, 50, -1], [5, 10, 15, 20, 25, 50, "All"]]
  });
});