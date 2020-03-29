package com.soda.onn.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soda.onn.member.model.dao.MemberDAO;
import com.soda.onn.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public int insertMember(Member member) {
		return memberDAO.insertMember(member);
	}

	@Override
	public Member selectMember(String col, String value) {
		return memberDAO.selectMember(col, value);
	}

	@Override
	public Member selectOne(String memberId) {
		return memberDAO.selectOne(memberId);
		}


	
}
