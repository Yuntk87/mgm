package Chat;

import java.io.*;

import java.net.*;

import java.util.*;



class Guest extends Thread {

	String id;// args0 번방 이름

	Server server;

	Socket socket;

	BufferedReader br;

	BufferedWriter bw;

	Guest(Server server, Socket socket) throws Exception {

		this.server = server;

		this.socket = socket;

		InputStream is = socket.getInputStream();

		InputStreamReader isr = new InputStreamReader(is);

		br = new BufferedReader(isr);

		OutputStream os = socket.getOutputStream();

		OutputStreamWriter osw = new OutputStreamWriter(os);

		bw = new BufferedWriter(osw);

	}

	public void run() {

		try {

			while (true) {

				String line = br.readLine();

				System.out.println(line + "읽음");

				String array[] = line.split("/");

				switch (array[0]) {

				case "enter":

					id = array[1];

					server.makeGuestlist();

					server.broadcast(line);

					server.makeRoomlist();

					break;

				case "msg":

					server.broadcastRoom(array[2], "msg/" + id + "/" + array[3]);

					break;

				case "exit":

//for(int i=0; i<server.list.size(); i++){

//if(server.list.get(i).id.equals(array[1]))

// server.removeGuest(server.list.get(i));

//}

					server.removeGuest(this);

					String str2 = "exit/" + array[1];

					server.broadcast(str2);

					break;

				case "귓속말":

					String[] talk = array[1].split("&");

					server.talkMsg(talk[0], talk[1], talk[2]);

					break;

//talk[0] 보낸놈

//talk[1] 받는놈

//talk[2] 할말

				case "mkroom":

//구민정(방장);

					server.addRoom(array[1], this);

					server.removeGuest(this);

					server.makeGuestlist();

					server.makeGuestlistRoom(array[1]);

					server.makeRoomlist();

					break;

				case "roomjoin":

					server.removeGuest(this); // 대기실에 자기 제외

					server.makeGuestlist(); // 다시 대기실 목록 뿌림

					server.addGuestRoom(array[2], this); // 그 방에 자기를 넣음

					server.makeGuestlistRoom(array[2]); // 방에 참여한 접속자리스트 생성

					server.makeRoomlist();

					break;

				case "roomout":

					server.removeGuestRoom(array[2], this);

					server.removeRoom(array[2]);

					server.makeGuestlist();

					server.makeRoomlist();

					break;

				}

			}

		} catch (Exception e) {

// e.printStackTrace();

//server.removeGuest(this);

			try {

			} catch (Exception e1) {

// TODO Auto-generated catch block

				e1.printStackTrace();

			}

		}

	}

	public void sendMsg(String msg) throws Exception {

		bw.write(msg + "\n");

		bw.flush();

	}

}