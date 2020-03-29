package com.soda.onn.member.model.service;

import com.soda.onn.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member member);

	Member selectMember(String col, String value);

	Member selectOne(String memberId);

}
