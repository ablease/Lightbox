var encrypt = document.getElementById('sign_up');
encrypt.addEventListener('click', function() {
  console.log("got clicked");
  var get_PassPhrase= document.getElementById('password');
  console.log(get_PassPhrase.value);
  var PassPhrase= get_PassPhrase.value;
  var Bits = 1024;
  var local_user_key = cryptico.generateRSAKey(PassPhrase, Bits);
  var local_user_public_key = cryptico.publicKeyString(local_user_key);


  console.log(local_user_public_key);
  document.getElementById("genr_pub_key").value = local_user_public_key;
  check_if_form_changed(local_user_public_key);
  save_private_key_as_session(PassPhrase);
},

false);


function check_if_form_changed(local_user_public_key){
  if(document.getElementById("genr_pub_key").value == local_user_public_key) {
    console.log('now in function addParameter');
    console.log('Javascript successfully posted in hidden field');
  } else {
    console.log('Adding Key to hidden field failed');
  }
}

function save_private_key_as_session(own_rsakey){
  window.name = own_rsakey;
};
