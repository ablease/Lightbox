$( document ).ready(function() {
  // var encrypt_conversation = document.getElementById('submit-button');
  // encrypt_conversation.addEventListener('click', function() {

    var get_PlainText= document.getElementById('input-text');
    var PlainText= get_PlainText.value;
    console.log('Text to encrypt ' + PlainText);

    var get_sender_email = document.getElementById('input-handle-email');
    var sender_email = get_sender_email.value;
    console.log('Current User is ' + sender_email);



    $.getJSON( "/pub_keys", function( data ) {


      var own_key= [];
      var publ_keys = [];
      var encrypted_messages = {};

      console.log( "ready!" );
      $.each( data, function( key, val ) {
        console.log(val.rsakeypub);
        publ_keys.push( val.rsakeypub );
      });
      console.log(publ_keys);

      $.each( data, function( key, val ) {
        var EncryptionResult = cryptico.encrypt(PlainText, val.rsakeypub);
        var EncryptionResultcipher = EncryptionResult.cipher;
        var receiver_of_text = val.email;
        console.log(receiver_of_text + ' This is receiver of text');
        encrypted_messages[receiver_of_text] = {encrypted_text: EncryptionResultcipher};
        console.log('This is encrypted!'+ encrypted_messages[receiver_of_text]['encrypted_text'] + 'This is encrypted!');

      });
      console.log(encrypted_messages);
      console.log('This is the first object' + encrypted_messages[sender_email]);
      decrypt_messge(encrypted_messages);
      put_encrypted_message_in_form(encrypted_messages);
    });


    function put_encrypted_message_in_form (encrypted_message){
      document.getElementById("input-text").value = JSON.stringify(encrypted_message);
      console.log('___________________________');
      console.log('___________________________');

      console.log('___________________________');
      console.log('got sent');
      console.log('___________________________');

      console.log('___________________________');


    }



    function decrypt_messge(encrypted_message){

      var your_message = encrypted_message[sender_email]['encrypted_text']
      console.log("Your message encrypted " + your_message);

      var local_user_key = cryptico.generateRSAKey(window.name, 1024);

      var local_user_public_key = cryptico.publicKeyString(local_user_key);

      console.log(local_user_public_key);

      var DecryptionResult = cryptico.decrypt(your_message, local_user_key);

      console.log('Your message unenecrypte -' + DecryptionResult.plaintext + '- THAT IS IT!');

    }
  // });
});
