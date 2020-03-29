package com.soda.onn.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.soda.onn.member.model.vo.Member;

@Repository
public class MemberDAOImpl  implements MemberDAO{

	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertMember(Member member) {
		return sqlSession.insert("member.insertMember", member);
	}

	@Override
	public Member selectMember(String col, String value) {
		return sqlSession.selectOne("member.selectMember","리턴파라미터 다시 만드셈");
	}

	@Override
	public Member selectOne(String memberId) {
		return sqlSession.selectOne("member.selectOne",memberId);
	}

}
