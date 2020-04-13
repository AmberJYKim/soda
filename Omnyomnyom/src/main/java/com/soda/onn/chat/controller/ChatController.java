package com.soda.onn.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.soda.onn.chat.model.service.ChatService;
import com.soda.onn.chat.model.vo.ChatMember;
import com.soda.onn.chat.model.vo.ChatRoom;
import com.soda.onn.chat.model.vo.Msg;
import com.soda.onn.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/chat")
public class ChatController {

	@Autowired
	private ChatService chatService;
	
	
	@GetMapping("/main")
	public String chat(Model model, 
			 		   HttpSession session,
			 		   @RequestParam(value = "getter", defaultValue = "sdmin", required = false) String getter){
		String memberId = ((Member)session.getAttribute("memberLoggedIn")).getMemberId();
		Map<String,String> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("getter", getter);
		String chatId = chatService.findChatIdByMemberId(map);
		log.debug(chatId);
		if(chatId == null) {
			chatId = createChatId(20);
			
			ChatRoom chatRoom = new ChatRoom(chatId);
			List<ChatMember> list = new ArrayList<>();
			list.add(new ChatMember(memberId, chatRoom));
			list.add(new ChatMember("sims2", chatRoom));
			
			//chat_room, chat_member테이블에 데이터 생성
			chatService.createChatRoom(list);
		}
		//chatId가 존재하는 경우, 채팅내역 조회
		else{
			List<Msg> chatList = chatService.findChatListByChatId(chatId);
			model.addAttribute("chatList", chatList);
		}
		
		log.debug("memberId=[{}], chatId=[{}]",memberId, chatId);
		model.addAttribute("chatId", chatId);
		return "mypage/directMsg";

	}
	@GetMapping("/fff")
	public String chatMain(Model model,
						   HttpSession session) {
		String memberId = ((Member)session.getAttribute("memberLoggedIn")).getMemberId();
		
		
		List<String> chatIdList = chatService.findChatIdByMemberId(memberId);
		model.addAttribute("chatIdList", chatIdList);
		
		
		return "mypage/directMsg";
	}
	
	
	/**
	 * 인자로 전달될 길이의 임의의 문자열을 생성하는 메소드
	 * 영대소문자/숫자의 혼합.
	 * 
	 * @param len
	 * @return
	 */
	private String createChatId(int len){
		Random rnd = new Random();
		StringBuffer buf = new StringBuffer();
		String prefix = "chat";
		
		do {
			buf.setLength(0);//buf 비우기 
			buf.append(prefix);
			for(int i=0; i<len-prefix.length(); i++){
				//임의의 참거짓에 따라 참=>영대소문자, 거짓=> 숫자
				switch(rnd.nextInt(3)) {
				case 0: buf.append((char)(rnd.nextInt(26)+65)); break;
				case 1: buf.append((char)(rnd.nextInt(26)+97)); break;
				case 2: buf.append((rnd.nextInt(10))); break;
				}
			}
		//중복여부 검사
		} while(chatService.selectOneChatId(buf.toString()) != null);
		log.info("chatId가 생성되었음 [{}]",buf.toString());
		
		return buf.toString();
	}	
	
	
	
	
	@MessageMapping("/chat/{chatId}")
	@SendTo(value={"/chat/{chatId}", "/chat/admin/push"})
	public Msg sendEcho(Msg fromMessage, 
						@DestinationVariable String chatId){
		log.debug("fromMessage={}",fromMessage);
		
		//db에 메세지로그
		chatService.insertChatLog(fromMessage);

		return fromMessage; 
	}

	@MessageMapping("/lastCheck")
	@SendTo(value={"/chat/admin/push"})
	public Msg lastCheck(@RequestBody Msg fromMessage){
		log.debug("lastCheck={}",fromMessage);
		
		//db에 채팅방별 사용자 최종확인 시각을 갱신한다.
		chatService.updateLastCheck(fromMessage);
		
		return fromMessage; 
	}
	
}
