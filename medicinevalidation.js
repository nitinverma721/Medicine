function alphaOnly(event) {
  var key = event.keyCode;
  return ((key >= 65 && key <= 90) || key == 8);
};

function numberOnly(event)
{
	  var charCode = event.keyCode;
   if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}

function alphaSpecific(event) {
  var key = event.keyCode;
  return ((key == 65 || key == 67) || (key == 97 || key==99));
}