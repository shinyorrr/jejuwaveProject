function getStartDate()  {
  const input_from = document.getElementById('input_from').value;
  document.getElementById("input_to").setAttribute("min", input_from);
}
