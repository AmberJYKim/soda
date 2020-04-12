package com.soda.onn.chat.model.service;

import java.util.List;
import java.util.Map;

import com.soda.onn.chat.model.vo.ChatMember;
import com.soda.onn.chat.model.vo.Msg;

public interface ChatService {

	String findChatIdByMemberId(String memberId);

	String selectOneChatId(String string);
	
	int createChatRoom(List<ChatMember> list);

	int insertChatLog(Msg fromMessage);

	int deleteChatRoom(String chatId);

	int updateLastCheck(Msg fromMessage);

	
	//관리자용
	List<Map<String, String>> findRecentList();

	List<Msg> findChatListByChatId(String chatId);


}
