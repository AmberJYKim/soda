package com.soda.onn.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.soda.onn.member.model.vo.DingDong;
import com.soda.onn.member.model.vo.Member;

public interface MemberDAO {

	int insertMember(Member member);

	Member selectMember(Map<String, String> map);

	Member selectOne(String memberId);

	List<Member> selectMemberList(RowBounds rowBounds);

	int selectMemberListCnt();

	int updateDingdong(int dingdongNo);

	int insertDingdong(String memberId);


	int selectDingdongListCnt();

	List<DingDong> dingdongList(String memberId, String size);

	List<Map<String, String>> dingdongListTest(Map<String, String> paramMap);

	Member memberInfo(String memberId);


	

}
