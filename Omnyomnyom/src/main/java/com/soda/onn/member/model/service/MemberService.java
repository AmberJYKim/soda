package com.soda.onn.member.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.soda.onn.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member member);

	Member selectMember(Map<String, String> map);

	Member selectOne(String memberId);

	List<Member> selectMemberList(RowBounds rowBounds);

	int selectMemberListCnt();

}
