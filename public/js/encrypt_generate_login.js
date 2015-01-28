var encrypt = document.getElementById('loginBtn');
encrypt.addEventListener('click', function() {
  alert("got clicked");
  var get_PassPhrase= document.getElementById('password');
  alert(get_PassPhrase.value);
  var PassPhrase= get_PassPhrase.value;
  var Bits = 1024;
  var local_user_key = cryptico.generateRSAKey(PassPhrase, Bits);
  var local_user_public_key = cryptico.publicKeyString(local_user_key);


  save_private_key_as_session(PassPhrase);
},

false);



function save_private_key_as_session(own_rsakey){
  window.name = own_rsakey;
};
