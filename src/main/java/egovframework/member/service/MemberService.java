package egovframework.member.service;

import egovframework.member.bean.MemberBean;

public interface MemberService {

	int insertMember(MemberBean bean);

	int selectLogin(MemberBean memberBean);

	int joinIdCheck(String id);

	MemberBean selectMemberOne(String id);

	void updateMember(MemberBean bean);



	

}
