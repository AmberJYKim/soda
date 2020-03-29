package com.soda.onn.member.model.dao;

import com.soda.onn.member.model.vo.Member;

public interface MemberDAO {

	int insertMember(Member member);

	Member selectMember(String col, String value);

	Member selectOne(String memberId);

}
