import 'bootstrap';
import 'jquery';
import * as Amber from 'amber';

function getConnectionToken() {
  // return $('meta[name="connectioin-token"]').content
  return 'asdf';
}

let socket = new Amber.Socket('/game');
socket.connect().then(() => {
  let playerChannel = socket.channel('user:' + getConnectionToken());
  playerChannel.join();

  let matchChannel = socket.channel('match:lobby');
  matchChannel.join();

  playerChannel.on('msg:invite', (message) => {

  });

  matchChannel.on('message_new', (message) => {
    console.log(message);
  });

  matchChannel.push('message_new', { message: 'amber websockets is the bomb diggity!' });

});

