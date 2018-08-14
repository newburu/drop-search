function open_window(type)
{
  switch(type)
  {
    case "author":
      url = '/authors/?mode=dialog';
      break;
  }
  window.open(url , 'SELECT', "width=500,height=700,resizable=yes,scrollbars=yes");
}

function dialog_select(name_id, name_val, id_id, id_val)
{
  $("#" + name_id).val(name_val);
  $("#" + id_id).val(id_val);
}
